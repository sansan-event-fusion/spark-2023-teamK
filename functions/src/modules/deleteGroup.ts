import { HttpHandler } from "../types";
import * as admin from "firebase-admin";

import { firestore } from "../lib/firebase";
const bucket = admin.storage().bucket();

type RequestData = {
  groupId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

export const deleteSpecificGroup: HttpHandler<
  RequestData,
  ResponseData
> = async (data, _) => {
  const { groupId } = data;
  const db = firestore();

  async function deleteDocAndSubCollections(docPath: string) {
    const docRef = db.doc(docPath);

    const collections = await docRef.listCollections();
    for (const collection of collections) {
      const collectionPath = `${docPath}/${collection.id}`;
      await deleteCollection(collectionPath, 10);
    }

    await docRef.delete();
  }

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

  async function deleteStorageFolder(folderPath: string) {
    const files = await bucket.getFiles({ prefix: folderPath });
    for (const file of files[0]) {
      await file.delete();
    }
  }

  try {
    const groupPath = `groups/${groupId}`;
    await deleteDocAndSubCollections(groupPath);

    const usersRef = db.collection("users");
    const usersSnapshot = await usersRef.get();

    usersSnapshot.forEach(async (userDoc) => {
      const userGroupId = userDoc.id;
      const userGroupPath = `users/${userGroupId}/groups/${groupId}`;
      await db.doc(userGroupPath).delete();
    });

    await deleteStorageFolder(`groups/${groupId}`);

    return { success: true };
  } catch (error) {
    return { success: false };
  }
};
