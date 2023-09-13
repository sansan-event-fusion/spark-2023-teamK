import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";

type RequestData = {
  groupId: string;
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
  const { groupId, description, imageUrlList, postId } = data;
  const db = firestore();

  const createdAt = new Date().toISOString();

  try {
    const postData = {
      postId,
      description,
      imageUrlList,
      createdAt,
    };
    const batch = db.batch();

    const groupPostRef = firestore()
      .collection("groups")
      .doc(groupId)
      .collection("posts")
      .doc(postId);
    batch.set(groupPostRef, postData);

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

