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

// 招待の承諾
// ユーザーがグループからの招待を承諾したとき

// [内容]
// [POST]: メンバー追加 (groups/members)
// [POST]: グループ追加(users/groups)
// [PATCH]: メンバー数更新(groups)
// [DELETE]: 招待中メンバー削除(groups/invited_members)

const db = firestore();

export const acceptInvitation: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  try {
    // ユーザー、招待ユーザー、グループの存在確認
    const userDocRef = db.collection("users").doc(data.userId);
    const invitedMemberDocRef = db
      .collection("groups")
      .doc(data.groupId)
      .collection("invited_members")
      .doc(data.userId);
    const groupDocRef = db.collection("groups").doc(data.groupId);
    const [userDoc, invitedMemberDoc, groupDoc] = await Promise.all([
      userDocRef.get(),
      invitedMemberDocRef.get(),
      groupDocRef.get(),
    ]);

    if (!userDoc.exists) {
      throw new Error("user not found");
    }
    if (!invitedMemberDoc.exists) {
      throw new Error("invited member not found");
    }
    if (!groupDoc.exists) {
      throw new Error("group not found");
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

    // [DELETE]: 招待中メンバー削除(groups/invited_members)
    batch.delete(invitedMemberDocRef);

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
