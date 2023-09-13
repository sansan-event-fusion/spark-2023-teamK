import { firestore } from "../lib/firebase";
import { FieldValue } from "firebase-admin/firestore";

import { HttpHandler } from "../types";
import { logger } from "firebase-functions";
import { Member } from "../model/groups/members";
import { User } from "../model/users";
import { UserGroup } from "../model/users/groups";
import { getNowDate } from "../lib/utils";

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
    // ユーザー、招待ユーザー、グループ、メンバーの存在確認
    const userDocRef = db.collection("users").doc(data.userId);
    const invitedMemberDocRef = db
      .collection("groups")
      .doc(data.groupId)
      .collection("invited_members")
      .doc(data.userId);
    const groupDocRef = db.collection("groups").doc(data.groupId);
    const memberDocRef = groupDocRef.collection("members").doc(data.userId);
    const [userDoc, invitedMemberDoc, groupDoc, memberDoc] = await Promise.all([
      userDocRef.get(),
      invitedMemberDocRef.get(),
      groupDocRef.get(),
      memberDocRef.get(),
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
    if (memberDoc.exists) {
      throw new Error("member already exists");
    }

    const batch = db.batch();

    // [POST]: メンバー追加 (groups/members)
    const memberBody: Member = (() => {
      const userData = userDoc.data() as User;
      return {
        memberId: data.userId,
        name: userData.name,
        role: "member",
        icon: userData.icon,
        description: "",
        createdAt: getNowDate(),
        updatedAt: getNowDate(),
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
      createdAt: getNowDate(),
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
