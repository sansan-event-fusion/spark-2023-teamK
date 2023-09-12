import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";

type RequestData = {
  userId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

export const deleteUser: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { userId } = data;

  async function deleteCollection(
    collectionPath: string,
    batchSize: number
  ): Promise<number> {
    const collectionRef = firestore.collection(collectionPath);
    const query = collectionRef.limit(batchSize);

    const deletedDocs = await deleteQueryBatch(query);

    if (deletedDocs >= batchSize) {
      return deleteCollection(collectionPath, batchSize);
    }

    return deletedDocs;
  }

  async function deleteQueryBatch(
    query: FirebaseFirestore.Query
  ): Promise<number> {
    const snapshot = await query.get();

    const batchSize = snapshot.size;
    if (batchSize === 0) {
      return 0;
    }

    const batch = firestore.batch();
    snapshot.docs.forEach((doc) => {
      batch.delete(doc.ref);
    });

    await batch.commit();

    return batchSize;
  }

  try {
    // Delete user's posts in each group
    const groupsSnapshot = await firestore.collection("groups").get();

    for (const groupDoc of groupsSnapshot.docs) {
      const groupId = groupDoc.id;
      const postsPath = `groups/${groupId}/members/${userId}/posts`;
      await deleteCollection(postsPath, 10);
    }

    // Delete user's posts
    const postsPath = `users/${userId}/posts`;
    await deleteCollection(postsPath, 10);

    return { success: true };
  } catch (error) {
    return { success: false, message: "" };
  }
};
