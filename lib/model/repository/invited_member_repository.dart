import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/invited_member/invited_member.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseInvitedMemberRepository {
  Future<List<InvitedMember>> retrieveInvitedMembers({required String groupId});
  Future<String> createInvitedMember(
      {required InvitedMember invitedMember, required String groupId});
  Future<void> updateInvitedMember(
      {required InvitedMember invitedMember, required String groupId});
  Future<void> deleteInvitedMember(
      {required String invitedMemberId, required String groupId});
}

final invitedMemberRepository =
    Provider<InvitedMemberRepository>((ref) => InvitedMemberRepository(ref));

class InvitedMemberRepository implements BaseInvitedMemberRepository {
  final Ref _ref;

  const InvitedMemberRepository(this._ref);

  @override
  Future<List<InvitedMember>> retrieveInvitedMembers(
      {required String groupId}) async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("invited_members")
          .get();
      return snap.docs.map((doc) => InvitedMember.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createInvitedMember(
      {required InvitedMember invitedMember, required String groupId}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("invited_members")
          .doc();

      await docRef
          .set(invitedMember.copyWith(invitedMemberId: docRef.id).toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateInvitedMember(
      {required InvitedMember invitedMember, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("invited_members")
          .doc(invitedMember.invitedMemberId)
          .update(invitedMember.toDocument());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteInvitedMember(
      {required String invitedMemberId, required String groupId}) async {
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
