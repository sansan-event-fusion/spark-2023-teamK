import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";
import { FieldValue } from "firebase-admin/firestore";
import { Post } from "../model/groups/posts";

type RequestData = {
  groupId: string;
  memberId: string;
  description: string;
  imageUrlList: Record<string, string>;
  postId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

export const createPost: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, memberId, description, imageUrlList, postId } = data;
  const db = firestore();

  try {
    const batch = db.batch();
    const groupPostRef = firestore()
      .collection("groups")
      .doc(groupId)
      .collection("posts")
      .doc(postId);
    const postBody: Post = (() => {
      return {
        postId: postId,
        memberId: memberId,
        description: description,
        imageUrlList: imageUrlList,
        createdAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      };
    })();
    batch.set(groupPostRef, postBody);
    batch.commit();
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
