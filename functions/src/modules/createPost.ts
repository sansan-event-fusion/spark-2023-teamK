import { onRequest } from "firebase-functions/v2/https";
import * as admin from 'firebase-admin';

export const createPostsToFirestore = onRequest(async (req, res) => {
    const groupId = req.body.groupId;
    const memberId = req.body.memberId;
    const postId = req.body.postId;
    const createdAt = req.body.createdAt;

    const data = {
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
            .add(data);
        res.json({ success: true, id: docRef.id });
    } catch (error) {
        res.json({ success: false, error: error.message });
    }
});