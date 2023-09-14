import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseAlbumRepository {
  Future<String> createAlbum({
    required Album album,
    required String groupId,
  });
  Future<void> updateAlbum({
    required Album album,
    required String groupId,
  });
  Future<void> deleteAlbum({
    required String albumId,
    required String groupId,
  });
  Future<List<Album>> getAllAlbumList({
    required String groupId,
  });
  Future<List<Album>> getLocalAlbumList({
    required String groupId,
  });
  Future<Stream<QuerySnapshot<Album>>> streamAlbumList({
    required String groupId,
  });
}

final albumRepository =
    Provider<AlbumRepository>((ref) => AlbumRepository(ref));

class AlbumRepository implements BaseAlbumRepository {
  final Ref _ref;

  const AlbumRepository(this._ref);

  @override
  Future<List<Album>> getAllAlbumList({required String groupId}) async {
    return await getQuery(groupId: groupId).then((ref) async => await ref
        .get()
        .then((value) async => await getLocalAlbumList(groupId: groupId)));
  }

  @override
  Future<List<Album>> getLocalAlbumList({required String groupId}) async {
    final snap = await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("albums")
        .get(const GetOptions(source: Source.cache));
    return snap.docs.map((doc) => Album.fromDocument(doc)).toList();
  }

  Future<Query<Album>> getQuery({required String groupId}) async {
    DocumentSnapshot? lastDocRef;
    await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("albums")
        .get(const GetOptions(source: Source.cache))
        .then((value) {
      if (value.docs.isNotEmpty) lastDocRef = value.docs.last;
    });

    Query<Album> ref = _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("albums")
        .withConverter(
          fromFirestore: (snapshot, _) => Album.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastDocRef != null) {
      ref = ref.orderBy("createdAt").startAtDocument(lastDocRef!);
    }

    return ref;
  }

  @override
  Future<Stream<QuerySnapshot<Album>>> streamAlbumList(
      {required String groupId}) async {
    final ref = await getQuery(groupId: groupId);
    return ref.snapshots();
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
