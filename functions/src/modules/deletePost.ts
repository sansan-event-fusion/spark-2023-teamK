import { HttpHandler } from "../types";
import * as admin from 'firebase-admin';

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

  const postRef = admin.firestore()
    .collection('groups')
    .doc(groupId)
    .collection('posts')
    .doc(postId);

  const memberPostRef = admin.firestore()
    .collection('groups')
    .doc(groupId)
    .collection('members')
    .doc(userId)
    .collection('posts')
    .doc(postId);

  try {
    await admin.firestore().runTransaction(async (transaction) => {
      transaction.delete(postRef);
      transaction.delete(memberPostRef);
    });

    return { success: true };
  } catch (error) {
    console.error(error);
    return { success: false };
  }
};
