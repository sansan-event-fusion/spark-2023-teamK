import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/pending_member/pending_member.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePendingMemberRepository {
  Future<String> createPendingMember({
    required PendingMember pendingMember,
    required String groupId,
  });
  Future<void> updatePendingMember({
    required PendingMember pendingMember,
    required String groupId,
  });
  Future<void> deletePendingMember({
    required String pendingMemberId,
    required String groupId,
  });
  Future<List<PendingMember>> getAllPendingMemberList({
    required String groupId,
  });
  Future<List<PendingMember>> getLocalPendingMemberList({
    required String groupId,
  });
  Future<Stream<QuerySnapshot<PendingMember>>> streamPendingMemberList({
    required String groupId,
  });
}

final pendingMemberRepository =
    Provider<PendingMemberRepository>((ref) => PendingMemberRepository(ref));

class PendingMemberRepository implements BasePendingMemberRepository {
  final Ref _ref;

  const PendingMemberRepository(this._ref);

  @override
  Future<List<PendingMember>> getAllPendingMemberList(
      {required String groupId}) async {
    return await getQuery(groupId: groupId).then((ref) async => await ref
        .get()
        .then((value) async =>
            await getLocalPendingMemberList(groupId: groupId)));
  }

  @override
  Future<List<PendingMember>> getLocalPendingMemberList(
      {required String groupId}) async {
    final snap = await _ref
        .read(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("pending_members")
        .get(const GetOptions(source: Source.cache));
    return snap.docs.map((doc) => PendingMember.fromDocument(doc)).toList();
  }

  Future<Query<PendingMember>> getQuery({required String groupId}) async {
    DocumentSnapshot? lastDocRef;
    await _ref
        .read(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("pending_members")
        .get(const GetOptions(source: Source.cache))
        .then((value) {
      if (value.docs.isNotEmpty) lastDocRef = value.docs.last;
    });

    Query<PendingMember> ref = _ref
        .read(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("pending_members")
        .withConverter(
          fromFirestore: (snapshot, _) =>
              PendingMember.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastDocRef != null) {
      ref = ref.orderBy("createdAt").startAtDocument(lastDocRef!);
    }

    return ref;
  }

  @override
  Future<Stream<QuerySnapshot<PendingMember>>> streamPendingMemberList(
      {required String groupId}) async {
    final ref = await getQuery(groupId: groupId);
    return ref.snapshots();
  }

  @override
  Future<String> createPendingMember(
      {required PendingMember pendingMember, required String groupId}) async {
    try {
      final docRef = _ref
          .read(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("pending_members")
          .doc(pendingMember.pendingMemberId);

      await docRef
          .set(pendingMember.copyWith(pendingMemberId: docRef.id).toJson());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updatePendingMember(
      {required PendingMember pendingMember, required String groupId}) async {
    try {
      await _ref
          .read(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("pending_members")
          .doc(pendingMember.pendingMemberId)
          .update(pendingMember.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deletePendingMember(
      {required String pendingMemberId, required String groupId}) async {
    try {
      await _ref
          .read(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("pending_members")
          .doc(pendingMemberId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
