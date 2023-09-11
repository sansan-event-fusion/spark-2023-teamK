import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/model/repository/member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final memberControllerProvider = StateNotifierProvider((ref) {
  return MemberController(ref);
});

class MemberController extends StateNotifier {
  final Ref _ref;
  MemberController(this._ref) : super(null);

  Future<List<Member>> retrieveMembers(
      {required String groupId}) async {
    try {
      final members = await _ref
          .watch(memberRepository)
          .retrieveMembers(groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(members);
      }
      return members;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> createMember(
      {required Member member, required String groupId}) async {
    try {
      final docRef = await _ref
          .watch(memberRepository)
          .createMember(member: member, groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(docRef);
      }
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateMember(
      {required Member member, required String groupId}) async {
    try {
      await _ref
          .watch(memberRepository)
          .updateMember(member: member, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteMember(
      {required String memberId, required String groupId}) async {
    try {
      await _ref
          .watch(memberRepository)
          .deleteMember(memberId: memberId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}