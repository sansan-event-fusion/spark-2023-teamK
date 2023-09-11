import { HttpHandler } from "../types";
import * as admin from 'firebase-admin';

type RequestData = {
    userId:string,
    groupId:string
};

type ResponseData = {
    success: boolean;
    message?: string;
};

export const deleteUser: HttpHandler<RequestData, ResponseData> = async (
    _,
    __
) => {
    const db = admin.firestore();

    async function deleteCollection(collectionPath: string, batchSize: number) {
        const collectionRef = db.collection(collectionPath);
        const query = collectionRef.limit(batchSize);

        const deletedDocs = await deleteQueryBatch(query);

        if (deletedDocs >= batchSize) {
            // There are more documents to delete
            return deleteCollection(collectionPath, batchSize);
        }

        return deletedDocs;
    }

    async function deleteQueryBatch(query: FirebaseFirestore.Query) {
        const snapshot = await query.get();

        const batchSize = snapshot.size;
        if (batchSize === 0) {
            return 0;
        }

        const batch = db.batch();
        snapshot.docs.forEach((doc) => {
            batch.delete(doc.ref);
        });

        await batch.commit();

        return batchSize;
    }

    try {
        const groupsSnapshot = await db.collection('groups').get();

        for (const groupDoc of groupsSnapshot.docs) {
            const groupId = groupDoc.id;
            const membersSnapshot = await db.collection(`groups/${groupId}/members`).get();

            for (const memberDoc of membersSnapshot.docs) {
                const memberId = memberDoc.id;
                const postsPath = `groups/${groupId}/members/${memberId}/posts`;
                await deleteCollection(postsPath, 10);
            }
        }

        return { success: true };
    } catch (error) {
        return { success: false};
    }
};
