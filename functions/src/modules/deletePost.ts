import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";
import * as admin from "firebase-admin";

type RequestData = {
  groupId: string;
  postId: string;
};

type ResponseData = {
  success: boolean;
};

export const deletePost: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, postId } = data;

  const db = firestore();
  const batch = db.batch();

  const bucket = admin.storage().bucket();

  try {
    const groupPostDocRef = db
      .collection("groups")
      .doc(groupId)
      .collection("posts")
      .doc(postId);

    batch.delete(groupPostDocRef);

    batch.commit();

    const prefix = `groups/${groupId}/posts/${postId}/`;

    const [files] = await bucket.getFiles({ prefix });
    const deletePromises = files.map((file) => file.delete());

    await Promise.all(deletePromises);

    return { success: true, id: groupId, error: "" };
  } catch (error) {
    if (error instanceof Error) {
      return {
        success: false,
        message: error.message,
      };
    }
    return { success: false, message: "unknown error" };
  }
};
