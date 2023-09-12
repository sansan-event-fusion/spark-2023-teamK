import * as admin from "firebase-admin";
import { HttpHandler } from "../types";
import { firestore } from "../lib/firebase";
import {
  getStorage,
  ref,
  uploadString,
  getDownloadURL,
} from "firebase/storage";

type RequestData = {
  groupId: string;
  memberId: string;
  description: string;
  imageUrlList: Record<string, string>;
  postId: string;
};

type ResponseData = {
  success: boolean;
  id: string;
};

export const createPost: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { groupId, memberId, description, imageUrlList, postId } = data;
  const storage = getStorage();
  const db = firestore();
  const createdAt = new Date().toISOString();

  try {
    const uploadedImages = await Promise.all(
      Object.keys(imageUrlList).map(async (key) => {
        const image = imageUrlList[key];
        const imageRef = ref(storage, `groups/posts/pictures/${postId}/${key}`);
        await uploadString(imageRef, image, "data_url");
        return getDownloadURL(imageRef);

        //画像はどのタイミングで保存する？URLとBlobの区別をつける必要がある。
      })
    );
    const postData = {
      description,
      imageUrlList,
      postId,
      imageUrlList: uploadedImages,
      createdAt,
    };
    const groupRef = db.collection("groups").doc(groupId);
    const memberRef = groupRef.collection("members").doc(memberId);

    await groupRef.collection("posts").add(postData);
    await memberRef.collection("posts").add(postData);
    await memberRef.collection("mentions").add(postData);

    return { success: true, id: groupRef.id };
  } catch (error) {
    return { success: false, id: "aa" };
  }
};
