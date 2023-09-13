import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";

type RequestData = {
  groupId: string;
  memberId: string;
  postId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
};
const db = firestore();
export const deleteUser: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, memberId, postId } = data;

  try {
    const batch = db.batch();
    const groupMemberDocRef = db
      .collection("groups")
      .doc(groupId)
      .collection("members")
      .doc(memberId);
    if (!(await groupMemberDocRef.get()).exists) {
      throw new Error("posts not found");
    }
    batch.delete(groupMemberDocRef);

    const groupPosts = await db
      .collection("groups")
      .doc(groupId)
      .collection("posts")
      .where("memberId", "==", memberId)
      .get();
    groupPosts.forEach((post) => {
      batch.delete(post.ref); // TODO: サブコレクションも削除するようにする
    });

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
