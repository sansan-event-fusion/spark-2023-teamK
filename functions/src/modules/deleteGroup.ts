import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";
import { Member } from "../model/groups/members";

const db = firestore();

type RequestData = {
  groupId: string;
  userId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

// グループ削除（httpリクエスト）
// ユーザーがグループを削除するとき

// [内容]
// [DELETE]: グループ削除(groups…)
// [DELETE]: グループ削除(users/groups)

export const deleteGroup: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, userId } = data;

  try {
    // ユーザー、メンバー、グループの存在確認
    const userDocRef = db.collection("users").doc(userId);
    const groupDocRef = db.collection("groups").doc(groupId);
    const memberDocRef = groupDocRef.collection("members").doc(userId);
    const [userDoc, groupDoc, memberDoc] = await Promise.all([
      userDocRef.get(),
      groupDocRef.get(),
      memberDocRef.get(),
    ]);

    if (!userDoc.exists) {
      throw new Error("user not found");
    }
    if (!groupDoc.exists) {
      throw new Error("group not found");
    }
    if (!memberDoc.exists) {
      throw new Error("member not found");
    }

    // roleがadminのユーザー以外は削除できない
    const memberData = memberDoc.data() as Member;
    if (memberData.role !== "admin") {
      throw new Error("only owner can delete group");
    }

    const batch = db.batch();

    // [DELETE]: グループ削除(groups…)
    batch.delete(groupDocRef);

    // [DELETE]: グループ削除(users/groups)
    const groupMembersRef = groupDocRef.collection("members");
    const groupMembersSnapshot = await groupMembersRef.get();
    groupMembersSnapshot.forEach((doc) => {
      const memberId = doc.id;
      const userGroupDocRef = db
        .collection("users")
        .doc(memberId)
        .collection("groups")
        .doc(groupId);
      batch.delete(userGroupDocRef);
    });

    await batch.commit();

    return { success: true, message: "group deleted" };
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
