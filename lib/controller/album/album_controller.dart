import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/model/repository/album_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumControllerProvider = StateNotifierProvider((ref) {
  return AlbumController(ref);
});

class AlbumController extends StateNotifier {
  final Ref _ref;
  AlbumController(this._ref) : super(null);

  Future<List<Album>> retrieveAlbums(
      {required String groupId}) async {
    try {
      final albums = await _ref
          .watch(albumRepository)
          .retrieveAlbums(groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(albums);
      }
      return albums;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> createAlbum(
      {required Album album, required String groupId}) async {
    try {
      final docRef = await _ref
          .watch(albumRepository)
          .createAlbum(album: album, groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(docRef);
      }
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateAlbum(
      {required Album album, required String groupId}) async {
    try {
      await _ref
          .watch(albumRepository)
          .updateAlbum(album: album, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteAlbum(
      {required String albumId, required String groupId}) async {
    try {
      await _ref
          .watch(albumRepository)
          .deleteAlbum(albumId: albumId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}