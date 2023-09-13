import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/pending_member/pending_member.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePendingMemberRepository {
  Future<List<PendingMember>> retrievePendingMembers({required String groupId});
  Future<String> createPendingMember(
      {required PendingMember pendingMember, required String groupId});
  Future<void> updatePendingMember(
      {required PendingMember pendingMember, required String groupId});
  Future<void> deletePendingMember(
      {required String pendingMemberId, required String groupId});
}

final pendingMemberRepository =
    Provider<PendingMemberRepository>((ref) => PendingMemberRepository(ref));

class PendingMemberRepository implements BasePendingMemberRepository {
  final Ref _ref;

  const PendingMemberRepository(this._ref);

  @override
  Future<List<PendingMember>> retrievePendingMembers(
      {required String groupId}) async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("pending_members")
          .get();
      return snap.docs.map((doc) => PendingMember.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createPendingMember(
      {required PendingMember pendingMember, required String groupId}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
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
          .watch(firebaseFirestoreProvider)
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
          .watch(firebaseFirestoreProvider)
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