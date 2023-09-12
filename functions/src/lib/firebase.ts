import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();
const firestore = admin.firestore;
const storage = admin.storage;

export { functions, firestore, storage };
