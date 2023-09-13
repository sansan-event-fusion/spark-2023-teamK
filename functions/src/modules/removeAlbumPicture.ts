import { firestore } from "../lib/firebase";
import { HttpHandler } from "../types";
import { FieldValue } from "firebase-admin/firestore";

type RequestData = {
  groupId: string;
  albumId: string;
  memberId: string;
  deletePictureId: string;
};

type ResponseData = {
  success: boolean;
  message?: string;
  id?: string;
};

// 画像削除
// ユーザーがアルバムの画像を削除するとき

// [内容]
// [DELETE]: 画像削除(groups/albums/album_pictures)
// [POST]: delete_albums_picture追加(groups/albums/deleted_album_pictures)
// [PATCH]: アルバムの画像枚数更新(groups/albums)

const db = firestore();

export const removeAlbumPicture: HttpHandler<
  RequestData,
  ResponseData
> = async (data, _) => {
  try {
    // ユーザー、グループ、アルバム、画像の存在確認
    const groupDocRef = db.collection("groups").doc(data.groupId);
    const memberDocRef = groupDocRef.collection("members").doc(data.memberId);
    const albumDocRef = groupDocRef.collection("albums").doc(data.albumId);
    const albumPictureDocRef = albumDocRef
      .collection("album_pictures")
      .doc(data.deletePictureId);

    const [groupDoc, memberDoc, albumDoc, albumPictureDoc] = await Promise.all([
      groupDocRef.get(),
      memberDocRef.get(),
      albumDocRef.get(),
      albumPictureDocRef.get(),
    ]);

    if (!groupDoc.exists) {
      throw new Error("group not found");
    }
    if (!memberDoc.exists) {
      throw new Error("member not found");
    }
    if (!albumDoc.exists) {
      throw new Error("album not found");
    }
    if (!albumPictureDoc.exists) {
      throw new Error("album picture not found");
    }

    const batch = db.batch();

    // [DELETE]: 画像削除(groups/albums/album_pictures)
    batch.delete(albumPictureDocRef);

    // [POST]: delete_albums_picture追加(groups/albums/deleted_album_pictures)
    const deleteAlbumPictureDocRef = albumDocRef
      .collection("deleted_album_pictures")
      .doc(data.deletePictureId);
    batch.set(deleteAlbumPictureDocRef, albumPictureDoc.data());

    // [PATCH]: アルバムの画像枚数更新(groups/albums)
    const updateAlbumBody = {
      pictureCount: FieldValue.increment(-1),
      updatedAt: FieldValue.serverTimestamp(),
    };
    batch.update(albumDocRef, updateAlbumBody);

    await batch.commit();

    return {
      success: true,
      message: "picture removed",
      id: data.deletePictureId,
    };
  } catch (error) {
    if (error instanceof Error) {
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
