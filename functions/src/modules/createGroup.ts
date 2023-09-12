import { HttpHandler } from "../types";
import * as admin from "firebase-admin";

type RequestData = {
  userId: string;
};

type ResponseData = {
  success: boolean;
  id: string;
};

export const createGroup: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  const { userId } = data;

  const postData = {
    userId,
  };

  try {
    const docRef = await admin.firestore().collection("groups").add(postData);

    return { success: true, id: docRef.id };
  } catch (error) {
    return { success: false, id: "aa" };
    //error追加したい
  }
};
