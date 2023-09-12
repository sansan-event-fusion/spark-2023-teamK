import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/model/repository/member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_controller.g.dart';

@riverpod
class MemberController extends _$MemberController {
  @override
  Future<List<Member>> build({required String groupId}) async {
    final members = await retrieveMembers();
    return members;
  }

  Future<List<Member>> retrieveMembers() async {
    try {
      final members =
          await ref.watch(memberRepository).retrieveMembers(groupId: groupId);
      state = AsyncValue.data(members);
      return members;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> createMember(
      {required Member member}) async {
    try {
      final docRef = await ref
          .watch(memberRepository)
          .createMember(member: member, groupId: groupId);
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateMember(
      {required Member member}) async {
    try {
      await ref
          .watch(memberRepository)
          .updateMember(member: member, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteMember(
      {required String memberId}) async {
    try {
      await ref
          .watch(memberRepository)
          .deleteMember(memberId: memberId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
