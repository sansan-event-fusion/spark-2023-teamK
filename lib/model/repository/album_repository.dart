import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseAlbumRepository {
  Future<List<Album>> retrieveAlbums({required String groupId});
  Future<String> createAlbum({required Album album, required String groupId});
  Future<void> updateAlbum({required Album album, required String groupId});
  Future<void> deleteAlbum({required String albumId, required String groupId});
}

final albumRepository =
    Provider<AlbumRepository>((ref) => AlbumRepository(ref));

class AlbumRepository implements BaseAlbumRepository {
  final Ref _ref;

  const AlbumRepository(this._ref);

  @override
  Future<List<Album>> retrieveAlbums({required String groupId}) async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .get();
      return snap.docs.map((doc) => Album.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createAlbum(
      {required Album album, required String groupId}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc();
      await docRef.set(album.copyWith(albumId: docRef.id).toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateAlbum(
      {required Album album, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc(album.albumId)
          .update(album.toDocument());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAlbum(
      {required String albumId, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc(albumId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
