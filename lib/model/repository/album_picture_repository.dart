import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/album_picture/album_picture.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseAlbumPictureRepository {
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
  Future<List<AlbumPicture>> getAllAlbumPictureList({
    required String groupId,
    required String albumId,
  });
  Future<List<AlbumPicture>> getLocalAlbumPictureList({
    required String groupId,
    required String albumId,
  });
  Future<Stream<QuerySnapshot<AlbumPicture>>> streamAlbumPictureList({
    required String groupId,
    required String albumId,
  });
}

final albumPictureRepository =
    Provider<AlbumPictureRepository>((ref) => AlbumPictureRepository(ref));

class AlbumPictureRepository implements BaseAlbumPictureRepository {
  final Ref _ref;

  const AlbumPictureRepository(this._ref);

  @override
  Future<List<AlbumPicture>> getAllAlbumPictureList({
    required String groupId,
    required String albumId,
  }) async {
    return await getQuery(groupId: groupId, albumId: albumId).then(
      (ref) async => await ref.get().then(
            (value) async => await getLocalAlbumPictureList(
                groupId: groupId, albumId: albumId),
          ),
    );
  }

  @override
  Future<List<AlbumPicture>> getLocalAlbumPictureList({
    required String groupId,
    required String albumId,
  }) async {
    final snap = await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("albums")
        .doc(albumId)
        .collection("album_pictures")
        .get(const GetOptions(source: Source.cache));
    return snap.docs.map((doc) => AlbumPicture.fromDocument(doc)).toList();
  }

  Future<Query<AlbumPicture>> getQuery({
    required String groupId,
    required String albumId,
  }) async {
    DocumentSnapshot? lastDocRef;
    await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("albums")
        .doc(albumId)
        .collection("album_pictures")
        .get(const GetOptions(source: Source.cache))
        .then((value) {
      if (value.docs.isNotEmpty) lastDocRef = value.docs.last;
    });

    Query<AlbumPicture> ref = _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("albums")
        .doc(albumId)
        .collection("album_pictures")
        .withConverter(
          fromFirestore: (snapshot, _) =>
              AlbumPicture.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastDocRef != null) {
      ref = ref.orderBy("createdAt").startAtDocument(lastDocRef!);
    }

    return ref;
  }

  @override
  Future<Stream<QuerySnapshot<AlbumPicture>>> streamAlbumPictureList({
    required String groupId,
    required String albumId,
  }) async {
    final ref = await getQuery(groupId: groupId, albumId: albumId);
    return ref.snapshots();
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
