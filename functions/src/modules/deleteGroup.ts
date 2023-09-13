import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";

const db = firestore();

type RequestData = {
  groupId: string;
  userId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

export const deleteGroup: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, userId } = data;

  try {
    const batch = db.batch();
    const userGroupDocRef = db
      .collection("users")
      .doc(userId)
      .collection("groups")
      .doc(groupId);
    if (!(await userGroupDocRef.get()).exists) {
      throw new Error("user not found");
    }
    batch.delete(userGroupDocRef);

    const groupDocRef = db.collection("groups").doc(groupId);

    if (!(await groupDocRef.get()).exists) {
      throw new Error("group not found");
    }
    batch.delete(groupDocRef);

    await batch.commit();

    return { success: true, message: "" };
  } catch (error) {
    if (error instanceof Error) {
      return { success: false, message: error.message };
    }
    return {
      success: false,
      message: "unknown error",
    };
  }
};
