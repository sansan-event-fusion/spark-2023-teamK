import { HttpHandler } from "../types";
import * as admin from "firebase-admin";
import { firestore } from "../lib/firebase";

type RequestData = {
  userId: string;
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
  const { userId, groupId, postId } = data;

  const db = firestore;

  const postRef = db
    .collection("groups")
    .doc(groupId)
    .collection("posts")
    .doc(postId);

  const memberPostRef = db
    .collection("groups")
    .doc(groupId)
    .collection("members")
    .doc(userId)
    .collection("posts")
    .doc(postId);

  const memberMentionRef = db
    .collection("groups")
    .doc(groupId)
    .collection("members")
    .doc(userId)
    .collection("mentions")
    .doc(postId);

  try {
    await db.runTransaction(async (transaction) => {
      transaction.delete(postRef);
      transaction.delete(memberPostRef);
      transaction.delete(memberMentionRef);
    });

    return { success: true };
  } catch (error) {
    console.error(error);
    return { success: false };
  }
};
