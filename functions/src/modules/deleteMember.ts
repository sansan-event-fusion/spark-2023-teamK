import { firestore } from "../lib/firebase";

import { HttpHandler } from "../types";
import { logger } from "firebase-functions";

type RequestData = {
  groupId: string;
  memberId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};

// [内容]
// [DELETE]: メンバー削除(groups/members…, groups/posts(退会メンバーの投稿データ))
// [DELETE]: グループ削除(users/groups)
// [PATCH]: メンバー数更新(groups)

const db = firestore();

export const deleteMember: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  // data info
  logger.info(
    `deleteMember: groupId: ${data.groupId}, memberId: ${data.memberId}`
  );

  try {
    const batch = db.batch();

    // グループ存在確認
    const groupDocRef = db.collection("groups").doc(data.groupId);
    if (!(await groupDocRef.get()).exists) {
      throw new Error("group not found");
    }

    // [DELETE]: メンバー削除(groups/members…)
    const memberDocRef = db
      .collection("groups")
      .doc(data.groupId)
      .collection("members")
      .doc(data.memberId);
    if (!(await memberDocRef.get()).exists) {
      throw new Error("member not found");
    }
    batch.delete(memberDocRef); // TODO: サブコレクションも削除するようにする

    // [DELETE]: 退会メンバー投稿削除(groups/posts...)
    const memberPosts = await db
      .collection("groups")
      .doc(data.groupId)
      .collection("posts")
      .where("memberId", "==", data.memberId)
      .get();
    memberPosts.forEach((post) => {
      batch.delete(post.ref); // TODO: サブコレクションも削除するようにする
    });
    // TODO: groups/members/postsの全削除

    // [DELETE]: グループ削除(users/groups)
    const userGroupDocRef = db
      .collection("users")
      .doc(data.memberId)
      .collection("groups")
      .doc(data.groupId);
    batch.delete(userGroupDocRef);

    // [PATCH]: メンバー数更新(groups)
    batch.update(groupDocRef, {
      memberCount: firestore.FieldValue.increment(-1),
    });

    await batch.commit();

    return {
      success: true,
    };
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
