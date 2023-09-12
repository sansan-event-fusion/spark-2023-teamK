import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/model/repository/album_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'album_controller.g.dart';

@riverpod
class AlbumController extends _$AlbumController {
  @override
  Future<List<Album>> build({required String groupId}) async {
    final repository = ref.read(albumRepository);
    final albums = await repository.getAllAlbumList(groupId: groupId);

    Future(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      streamAlbumList();
    });

    return albums;
  }

  /// Album 監視
  void streamAlbumList() {
    ref.read(albumRepository).streamAlbumList(groupId: groupId).then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<Album> latestAlbumList =
            await ref.read(albumRepository).getLocalAlbumList(groupId: groupId);
        state = AsyncData(latestAlbumList);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  Future<String> createAlbum(
      {required Album album, required String groupId}) async {
    try {
      final docRef = await ref
          .read(albumRepository)
          .createAlbum(album: album, groupId: groupId);

      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateAlbum(
      {required Album album, required String groupId}) async {
    try {
      await ref
          .read(albumRepository)
          .updateAlbum(album: album, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteAlbum(
      {required String albumId, required String groupId}) async {
    try {
      await ref
          .read(albumRepository)
          .deleteAlbum(albumId: albumId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
