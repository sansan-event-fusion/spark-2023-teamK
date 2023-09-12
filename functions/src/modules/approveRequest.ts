import { firestore } from "../lib/firebase";
import { FieldValue } from "firebase-admin/firestore";

import { HttpHandler } from "../types";
import { logger } from "firebase-functions";
import { Member } from "../model/groups/members";
import { User } from "../model/users";
import { UserGroup } from "../model/users/groups";

type RequestData = {
  userId: string;
  groupId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

// 参加リクエスト承認
// グループがユーザーからの参加リクエストを承認したとき

// [内容]
// [POST]: メンバー追加 (groups/members)
// [POST]: グループ追加(users/groups)
// [PATCH]: メンバー数更新(groups)
// [DELETE]: 承認待ちメンバー削除(groups/pending_members)

const db = firestore();

export const approveRequest: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  try {
    // ユーザー、承認待ちユーザー、グループの存在確認
    const userDocRef = db.collection("users").doc(data.userId);
    const pendingMemberDocRef = db
      .collection("groups")
      .doc(data.groupId)
      .collection("pending_members")
      .doc(data.userId);
    const groupDocRef = db.collection("groups").doc(data.groupId);
    const [userDoc, pendingMemberDoc, groupDoc] = await Promise.all([
      userDocRef.get(),
      pendingMemberDocRef.get(),
      groupDocRef.get(),
    ]);

    if (!userDoc.exists) {
      throw new Error("user not found");
    }
    if (!groupDoc.exists) {
      throw new Error("group not found");
    }
    if (!pendingMemberDoc.exists) {
      throw new Error("pending member not found");
    }

    const batch = db.batch();

    // [POST]: メンバー追加 (groups/members)
    const memberDocRef = db
      .collection("groups")
      .doc(data.groupId)
      .collection("members")
      .doc(data.userId);

    const memberBody: Member = (() => {
      const userData = userDoc.data() as User;
      return {
        memberId: data.userId,
        name: userData.name,
        role: "member",
        icon: userData.icon,
        description: "",
        createdAt: FieldValue.serverTimestamp(),
        updatedAt: FieldValue.serverTimestamp(),
      };
    })();
    batch.set(memberDocRef, memberBody);

    // [POST]: グループ追加(users/groups)
    const userGroupDocRef = db
      .collection("users")
      .doc(data.userId)
      .collection("groups")
      .doc(data.groupId);
    const userGroupBody: UserGroup = {
      groupId: data.groupId,
      createdAt: FieldValue.serverTimestamp(),
    };
    batch.set(userGroupDocRef, userGroupBody);

    // [PATCH]: メンバー数更新(groups)
    batch.update(groupDocRef, {
      memberCount: FieldValue.increment(1),
    });

    // [DELETE]: 承認待ちメンバー削除(groups/pending_members)
    batch.delete(pendingMemberDocRef);

    await batch.commit();

    return { success: true };
  } catch (error) {
    if (error instanceof Error) {
      logger.error(error.message);
      return {
        success: false,
        message: error.message,
      };
    }
    return {
      success: false,
      message: "unknown error",
    };
  }
};
