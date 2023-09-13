import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";
import { FieldValue } from "firebase-admin/firestore";

type RequestData = {
  userId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

// ユーザー削除
// ユーザーが削除されたとき

// [内容]
// [DELETE]: ユーザー削除(users)
// 以下、退会処理と同様（所属グループすべてに対して行う）
// [DELETE]: メンバー削除(groups/members…, groups/posts(退会メンバーの投稿データ))
// [DELETE]: グループ削除(users/groups)
// [PATCH]: メンバー数更新(groups)

const db = firestore();
export const deleteUser: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  try {
    // ユーザーの存在確認
    const userDocRef = db.collection("users").doc(data.userId);
    const userDoc = await userDocRef.get();
    if (!userDoc.exists) {
      throw new Error("user not found");
    }

    // ユーザーの所属グループ取得
    const userGroups = await db
      .collection("users")
      .doc(data.userId)
      .collection("groups")
      .get();
    const groupIds = userGroups.docs.map((doc) => doc.id);

    // 各グループからの退会処理
    const batch = db.batch();

    // 退会処理
    await Promise.all(
      groupIds.map(async (groupId) => {
        // グループ存在確認
        const groupDocRef = db.collection("groups").doc(groupId);
        if (!(await groupDocRef.get()).exists) {
          throw new Error("group not found");
        }

        // [DELETE]: メンバー削除(groups/members…)
        const memberDocRef = db
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc(data.userId);
        if (!(await memberDocRef.get()).exists) {
          throw new Error("member not found");
        }
        batch.delete(memberDocRef); // TODO: サブコレクションも削除するようにする

        // [DELETE]: 退会メンバー投稿削除(groups/posts...)
        const memberPosts = await db
          .collection("groups")
          .doc(groupId)
          .collection("posts")
          .where("memberId", "==", data.userId)
          .get();
        memberPosts.forEach((post) => {
          batch.delete(post.ref); // TODO: サブコレクションも削除するようにする
        });

        // [DELETE]: グループ削除(users/groups)
        const userGroupDocRef = db
          .collection("users")
          .doc(data.userId)
          .collection("groups")
          .doc(groupId);
        batch.delete(userGroupDocRef);

        // [PATCH]: メンバー数更新(groups)
        batch.update(groupDocRef, {
          memberCount: FieldValue.increment(-1),
        });
      })
    );

    // [DELETE]: ユーザー削除(users)
    batch.delete(userDocRef);

    await batch.commit();

    return { success: true, message: "user deleted" };
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
