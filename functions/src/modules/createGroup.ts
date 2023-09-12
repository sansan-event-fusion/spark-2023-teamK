import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";

type RequestData = {
  groupId: string;
  memberId: string;
  name: string;
  description: string;
  icon: string;
};

type ResponseData = {
  success: boolean;
  id: string;
  error: string;
};

export const createGroup: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, memberId, name, description, icon } = data;
  const role = "admin";
  const createdAt = new Date().toISOString();
  const updatedAt = createdAt;

  const groupData = { name, description, icon, createdAt, updatedAt };

  try {
    await firestore().collection("groups").doc(groupId).set(groupData);

    await firestore()
      .collection("users")
      .doc(memberId)
      .collection("groups")
      .doc(groupId)
      .set({ groupId, createdAt });

    const userSnapshot = await firestore()
      .collection("users")
      .doc(memberId)
      .get();
    if (!userSnapshot.exists) {
      throw new Error("Member does not exist");
    }
    const userData = userSnapshot.data();
    if (!userData) {
      throw new Error("Member does not exist");
    }
    const userName = userData.name;

    await firestore()
      .collection("groups")
      .doc(groupId)
      .collection("members")
      .doc(memberId)
      //memberIdの保存は明記すべき？docで指定できてる？
      .set({ name: userName, role, memberId, createdAt, updatedAt });

    return { success: true, id: groupId, error: "" };
  } catch (error) {
    return { success: false, id: "", error: "" };
  }
};
