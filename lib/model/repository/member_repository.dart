import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseMemberRepository {
  Future<List<Member>> retrieveMembers({required String groupId});
  Future<String> createMember(
      {required Member member, required String groupId});
  Future<void> updateMember({required Member member, required String groupId});
  Future<void> deleteMember(
      {required String memberId, required String groupId});
}

final memberRepository =
    Provider<MemberRepository>((ref) => MemberRepository(ref));

class MemberRepository implements BaseMemberRepository {
  final Ref _ref;

  const MemberRepository(this._ref);

  @override
  Future<List<Member>> retrieveMembers({required String groupId}) async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .get();
      return snap.docs.map((doc) => Member.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createMember(
      {required Member member, required String groupId}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc();

      await docRef.set(member.copyWith(memberId: docRef.id).toDocument());

      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateMember(
      {required Member member, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc(member.memberId)
          .update(member.toDocument());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteMember(
      {required String memberId, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc(memberId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
