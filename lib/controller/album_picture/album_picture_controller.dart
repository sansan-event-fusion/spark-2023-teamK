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

  Future<String> createAlbumPicture(
      {required AlbumPicture albumPicture}) async {
    try {
      final docRef = await ref.read(albumPictureRepository).createAlbumPicture(
          albumPicture: albumPicture, groupId: groupId, albumId: albumId);

      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateAlbumPicture({required AlbumPicture albumPicture}) async {
    try {
      await ref.read(albumPictureRepository).updateAlbumPicture(
          albumPicture: albumPicture, groupId: groupId, albumId: albumId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteAlbumPicture({required String albumPictureId}) async {
    try {
      await ref.read(albumPictureRepository).deleteAlbumPicture(
          albumPictureId: albumPictureId, groupId: groupId, albumId: albumId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
