import 'package:emo_project/model/invited_member/invited_member.dart';
import 'package:emo_project/model/repository/invited_member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final invitedMemberControllerProvider = StateNotifierProvider((ref) {
  return InvitedMemberController(ref);
});

class InvitedMemberController extends StateNotifier {
  final Ref _ref;
  InvitedMemberController(this._ref) : super(null);

  Future<List<InvitedMember>> retrieveInvitedMembers(
      {required String groupId}) async {
    try {
      final invitedMembers = await _ref
          .watch(invitedMemberRepository)
          .retrieveInvitedMembers(groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(invitedMembers);
      }
      return invitedMembers;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> createInvitedMember(
      {required InvitedMember invitedMember, required String groupId}) async {
    try {
      final docRef = await _ref
          .watch(invitedMemberRepository)
          .createInvitedMember(invitedMember: invitedMember, groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(docRef);
      }
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateInvitedMember(
      {required InvitedMember invitedMember, required String groupId}) async {
    try {
      await _ref
          .watch(invitedMemberRepository)
          .updateInvitedMember(invitedMember: invitedMember, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteInvitedMember(
      {required String invitedMemberId, required String groupId}) async {
    try {
      await _ref
          .watch(invitedMemberRepository)
          .deleteInvitedMember(invitedMemberId: invitedMemberId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}