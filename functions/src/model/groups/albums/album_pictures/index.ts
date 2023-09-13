import { FieldValue } from "firebase-admin/firestore";

export type AlbumPicture = {
  albumPictureId: string;
  memberId: string;
  imageUrl: string;
  createdAt: Date | FieldValue;
};
