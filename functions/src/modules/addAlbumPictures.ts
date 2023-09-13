import { firestore } from "../lib/firebase";
import { FieldValue } from "firebase-admin/firestore";

import { HttpHandler } from "../types";
import { logger } from "firebase-functions";
import { AlbumPicture } from "../model/groups/albums/album_pictures";
import { getNowDate } from "../lib/utils";

type RequestData = {
  groupId: string;
  albumId: string;
  memberId: string;
  pictureUrls: string[];
};

type ResponseData = {
  success: boolean;
  message?: string;
};

// アルバム画像追加
// ユーザーがアルバムに画像を追加するとき

// [内容]
// DB
// [POST]: アルバム画像追加(groups/albums/album_pictures)
// [PATCH]: アルバムの画像枚数更新(groups/albums)

const db = firestore();

export const addAlbumPictures: HttpHandler<RequestData, ResponseData> = async (
  data,
  _
) => {
  try {
    // 画像URLが空の場合はエラー
    if (data.pictureUrls.length === 0) {
      throw new Error("pictureUrls is empty");
    }

    // ユーザー、グループ、アルバムの存在確認
    const groupDocRef = db.collection("groups").doc(data.groupId);
    const memberDocRef = groupDocRef.collection("members").doc(data.memberId);
    const albumDocRef = groupDocRef.collection("albums").doc(data.albumId);

    const [groupDoc, memberDoc, albumDoc] = await Promise.all([
      groupDocRef.get(),
      memberDocRef.get(),
      albumDocRef.get(),
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

    const batch = db.batch();

    // [POST]: アルバム画像追加(groups/albums/album_pictures)
    const albumPictureDocRef = albumDocRef.collection("album_pictures");
    data.pictureUrls.forEach((pictureUrl) => {
      const pictureDocRef = albumPictureDocRef.doc();
      const albumPictureBody: AlbumPicture = {
        albumPictureId: pictureDocRef.id,
        memberId: data.memberId,
        imageUrl: pictureUrl,
        createdAt: getNowDate(),
      };
      batch.set(pictureDocRef, albumPictureBody);
    });

    // [PATCH]: アルバムの画像枚数更新(groups/albums)
    const updateAlbumBody = {
      pictureCount: FieldValue.increment(data.pictureUrls.length),
      updatedAt: getNowDate(),
    };
    batch.update(albumDocRef, updateAlbumBody);

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
