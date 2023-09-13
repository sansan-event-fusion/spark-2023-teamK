import { FieldValue } from "firebase-admin/firestore";

export type Album = {
  albumId: string;
  name: string;
  description: string;
  pictureCount: number;
  deletedPictureCount: number;
  createdAt: Date | FieldValue;
  updatedAt: Date | FieldValue;
};
