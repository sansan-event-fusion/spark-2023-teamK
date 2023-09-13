import { FieldValue } from "firebase-admin/firestore";

type Role = "admin" | "member";

export type Member = {
  memberId: string;
  name: string;
  role: Role;
  icon: string;
  description: string;
  createdAt: Date | FieldValue;
  updatedAt: Date | FieldValue;
};
