import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/album_picture/album_picture.dart';
import 'package:emo_project/model/repository/album_picture_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'album_picture_controller.g.dart';

@riverpod
class AlbumPictureController extends _$AlbumPictureController {
  @override
  Future<List<AlbumPicture>> build({
    required String groupId,
    required String albumId,
  }) async {
    final repository = ref.read(albumPictureRepository);
    final albumPictures = await repository.getAllAlbumPictureList(
        groupId: groupId, albumId: albumId);

    Future(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      streamAlbumPictureList();
    });

    return albumPictures;
  }

  /// AlbumPicture 監視
  void streamAlbumPictureList() {
    ref
        .read(albumPictureRepository)
        .streamAlbumPictureList(groupId: groupId, albumId: albumId)
        .then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<AlbumPicture> latestAlbumPictureList = await ref
            .read(albumPictureRepository)
            .getLocalAlbumPictureList(groupId: groupId, albumId: albumId);
        state = AsyncData(latestAlbumPictureList);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  Future<bool> createAlbumPicture({
    required String albumId,
    required String groupId,
    required String memberId,
    required List<String> pictureUrls,
  }) async {
    try {
      return await ref.read(albumPictureRepository).createAlbumPicture(
            albumId: albumId,
            groupId: groupId,
            memberId: memberId,
            pictureUrls: pictureUrls,
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> deleteAlbumPicture({
    required String albumPictureId,
    required String albumId,
    required String groupId,
    required String memberId,
  }) async {
    try {
      return await ref.read(albumPictureRepository).deleteAlbumPicture(
            albumPictureId: albumPictureId,
            albumId: albumId,
            groupId: groupId,
            memberId: memberId,
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
