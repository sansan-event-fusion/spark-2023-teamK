import * as admin from 'firebase-admin';
import { HttpHandler } from "../types";

type RequestData = {
    groupId: string;
    memberId: string;
    postId: string;
    createdAt: string;
};

type ResponseData = {
    success: boolean;
    id: string;
};

export const createPost: HttpHandler<RequestData, ResponseData> =async (
    data,
    _
) => {
    const { groupId, memberId, postId, createdAt } = data;

    const postData = {
        postId,
        createdAt,
    };

    try {
        const docRef = await admin.firestore()
            .collection('groups')
            .doc(groupId)
            .collection('members')
            .doc(memberId)
            .collection('posts')
            .add(postData);

        return { success: true, id: docRef.id };
    } catch (error) {
        return { success: false, id:"aa"};
        //error追加したい
    }
};