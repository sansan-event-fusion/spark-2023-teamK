import { FieldValue } from "firebase-admin/firestore";

export type UserGroup = {
  groupId: string;
  createdAt: Date | FieldValue;
};
