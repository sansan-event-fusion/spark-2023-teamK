import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:emo_project/model/invited_member/invited_member.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseInvitedMemberRepository {
  Future<void> createInvitedMember({
    required InvitedMember invitedMember,
    required String groupId,
  });
  Future<void> acceptInvitation({
    required String invitedMemberId,
    required String groupId,
  });
  Future<void> deleteInvitedMember({
    required String invitedMemberId,
    required String groupId,
  });
  Future<List<InvitedMember>> getAllInvitedMemberList({
    required String groupId,
  });
  Future<List<InvitedMember>> getLocalInvitedMemberList({
    required String groupId,
  });
  Future<Stream<QuerySnapshot<InvitedMember>>> streamInvitedMemberList({
    required String groupId,
  });
}

final invitedMemberRepository =
    Provider<InvitedMemberRepository>((ref) => InvitedMemberRepository(ref));

class InvitedMemberRepository implements BaseInvitedMemberRepository {
  final Ref _ref;

  const InvitedMemberRepository(this._ref);

  @override
  Future<List<InvitedMember>> getAllInvitedMemberList(
      {required String groupId}) async {
    return await getQuery(groupId: groupId).then((ref) async => await ref
        .get()
        .then((value) async =>
            await getLocalInvitedMemberList(groupId: groupId)));
  }

  @override
  Future<List<InvitedMember>> getLocalInvitedMemberList(
      {required String groupId}) async {
    final snap = await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("invited_members")
        .get(const GetOptions(source: Source.cache));
    return snap.docs.map((doc) => InvitedMember.fromDocument(doc)).toList();
  }

  Future<Query<InvitedMember>> getQuery({required String groupId}) async {
    DocumentSnapshot? lastDocRef;
    await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("invited_members")
        .get(const GetOptions(source: Source.cache))
        .then((value) {
      if (value.docs.isNotEmpty) lastDocRef = value.docs.last;
    });

    Query<InvitedMember> ref = _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("invited_members")
        .withConverter(
          fromFirestore: (snapshot, _) =>
              InvitedMember.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastDocRef != null) {
      ref = ref.orderBy("createdAt").startAtDocument(lastDocRef!);
    }

    return ref;
  }

  @override
  Future<Stream<QuerySnapshot<InvitedMember>>> streamInvitedMemberList(
      {required String groupId}) async {
    final ref = await getQuery(groupId: groupId);
    return ref.snapshots();
  }

  @override
  Future<void> createInvitedMember({
    required InvitedMember invitedMember,
    required String groupId,
  }) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("invited_members")
          .doc(invitedMember.invitedMemberId);

      await docRef
          .set(invitedMember.copyWith(invitedMemberId: docRef.id).toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  // userId == firebaseUser.uid
  @override
  Future<void> acceptInvitation({
    required String invitedMemberId,
    required String groupId,
  }) async {
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable('acceptInvitation')
          .call(
        {
          "userId": invitedMemberId,
          "groupId": groupId,
        },
      );
      print(result.data);
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteInvitedMember({
    required String invitedMemberId,
    required String groupId,
  }) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("invited_members")
          .doc(invitedMemberId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
