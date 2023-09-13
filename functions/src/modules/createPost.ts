import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";
import { Post } from "../model/groups/posts";
import { getNowDate } from "../lib/utils";

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
        createdAt: getNowDate(),
        updatedAt: getNowDate(),
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
