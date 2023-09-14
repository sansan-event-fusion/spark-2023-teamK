import { HttpHandler } from "../types";
import { FieldValue } from "firebase-admin/firestore";

import { firestore } from "../lib/firebase";
import { logger } from "firebase-functions";
import { UserGroup } from "../model/users/groups";
import { Member, MemberRole } from "../model/groups/members";
import { getNowDate } from "../lib/utils";
import { User } from "../model/users";

type RequestData = {
  groupId: string;
  memberId: string;
  name?: string;
  description?: string;
  icon?: string;
  role?: MemberRole;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

// グループ作成（httpリクエスト）
// グループにメンバーを追加

// [内容]
// // [POST]: グループ作成(groups)  フロントで実装
// [POST]: グループ追加(users/groups)
// [POST]: メンバー追加(groups/members)
// [PATCH]: メンバーカウント更新(groups)

const db = firestore();

export const addMember: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  try {
    // グループ、ユーザー、メンバーの存在確認
    const groupDocRef = db.collection("groups").doc(data.groupId);
    const userDocRef = db.collection("users").doc(data.memberId);
    const memberDocRef = groupDocRef.collection("members").doc(data.memberId);
    const [groupDoc, userDoc, memberDoc] = await Promise.all([
      groupDocRef.get(),
      userDocRef.get(),
      memberDocRef.get(),
    ]);

    if (!groupDoc.exists) {
      throw new Error("group not found");
    }
    if (!userDoc.exists) {
      throw new Error("user not found");
    }
    if (memberDoc.exists) {
      throw new Error("member already exists");
    }

    const batch = db.batch();

    // [POST]: グループ追加(users/groups)
    const userGroupRef = db
      .collection("users")
      .doc(data.memberId)
      .collection("groups")
      .doc(data.groupId);
    const userGroupBody: UserGroup = {
      groupId: data.groupId,
      createdAt: getNowDate(),
    };
    batch.set(userGroupRef, userGroupBody);

    // [POST]: メンバー追加(groups/members)
    const userData: User = (() => {
      if (userDoc.data() === undefined)
        throw new Error("user data is undefined");
      return userDoc.data() as User;
    })();

    const groupMemberRef = db
      .collection("groups")
      .doc(data.groupId)
      .collection("members")
      .doc(data.memberId);
    const groupMemberBody: Member = {
      memberId: data.memberId,
      name: data.name ?? userData.name,
      role: data.role ?? "member",
      description: data.description ?? "",
      icon: data.icon ?? userData.icon,
      createdAt: getNowDate(),
      updatedAt: getNowDate(),
    };
    batch.set(groupMemberRef, groupMemberBody);

    // [PATCH]: メンバーカウント更新(groups)
    batch.update(groupDocRef, {
      memberCount: FieldValue.increment(1),
    });

    await batch.commit();

    return { success: true, id: data.groupId, error: "" };
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
