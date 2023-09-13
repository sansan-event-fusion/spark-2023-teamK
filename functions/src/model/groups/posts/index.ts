import { FieldValue } from "firebase-admin/firestore";

export type Post = {
  postId: string;
  memberId: string;
  description: string;
  imageUrlList: Record<string, string>;
  createdAt: Date | FieldValue;
  updatedAt: Date | FieldValue;
};
