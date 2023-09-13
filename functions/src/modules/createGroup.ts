import { HttpHandler } from "../types";

import { firestore } from "../lib/firebase";
import { logger } from "firebase-functions";

type RequestData = {
  groupId: string;
  memberId: string;
  name: string;
  description: string;
  icon: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

export const createGroup: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const db = firestore();

  const { groupId, memberId, icon } = data;

  const role = "admin";
  const createdAt = new Date().toISOString();
  const updatedAt = createdAt;

  try {
    const batch = db.batch();

    const userGroupRef = firestore()
      .collection("users")
      .doc(memberId)
      .collection("groups")
      .doc(groupId);
    batch.set(userGroupRef, { groupId: groupId, createdAt: createdAt });
    const userSnapshot = await firestore()
      .collection("users")
      .doc(memberId)
      .get();
    if (!userSnapshot.exists) {
      throw new Error("Member does not exist 1");
    }
    const userData = userSnapshot.data();
    if (!userData) {
      throw new Error("Member does not exist 2");
    }
    const userName = userData.name;

    const groupMemberRef = firestore()
      .collection("groups")
      .doc(groupId)
      .collection("members")
      .doc(memberId);
    batch.set(groupMemberRef, {
      name: userName,
      role,
      memberId,
      createdAt,
      updatedAt,
      icon,
    });

    batch.commit();

    return { success: true, id: groupId, error: "" };
  } catch (error) {
    if (error instanceof Error) {
      logger.error(error.message);
      return {
        success: false,
        message: error.message,
      };
    }
    return { success: false, message: "unknown error" };
  }
};
