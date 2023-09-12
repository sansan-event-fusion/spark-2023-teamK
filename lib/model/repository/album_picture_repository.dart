import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/album_picture/album_picture.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseAlbumPictureRepository {
  Future<List<AlbumPicture>> retrieveAlbumPictures({
    required String albumId,
    required String groupId,
  });
  Future<String> createAlbumPicture({
    required AlbumPicture albumPicture,
    required String albumId,
    required String groupId,
  });
  Future<void> updateAlbumPicture({
    required AlbumPicture albumPicture,
    required String albumId,
    required String groupId,
  });
  Future<void> deleteAlbumPicture({
    required String albumPictureId,
    required String albumId,
    required String groupId,
  });
}

final albumPictureRepository =
    Provider<AlbumPictureRepository>((ref) => AlbumPictureRepository(ref));

class AlbumPictureRepository implements BaseAlbumPictureRepository {
  final Ref _ref;

  const AlbumPictureRepository(this._ref);

  @override
  Future<List<AlbumPicture>> retrieveAlbumPictures({
    required String albumId,
    required String groupId,
  }) async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc(albumId)
          .collection("albumPictures")
          .get();
      return snap.docs.map((doc) => AlbumPicture.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createAlbumPicture({
    required AlbumPicture albumPicture,
    required String albumId,
    required String groupId,
  }) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc(albumId)
          .collection("albumPictures")
          .doc();
      await docRef
          .set(albumPicture.copyWith(albumPictureId: docRef.id).toJson());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateAlbumPicture({
    required AlbumPicture albumPicture,
    required String albumId,
    required String groupId,
  }) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc(albumId)
          .collection("albumPictures")
          .doc(albumPicture.albumPictureId)
          .update(albumPicture.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAlbumPicture({
    required String albumPictureId,
    required String albumId,
    required String groupId,
  }) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("albums")
          .doc(albumId)
          .collection("albumPictures")
          .doc(albumPictureId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
