import 'package:emo_project/model/pending_member/pending_member.dart';
import 'package:emo_project/model/repository/pending_member_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pendingMemberControllerProvider = StateNotifierProvider((ref) {
  return PendingMemberController(ref);
});

class PendingMemberController extends StateNotifier {
  final Ref _ref;
  PendingMemberController(this._ref) : super(null);

  Future<List<PendingMember>> retrievePendingMembers(
      {required String groupId}) async {
    try {
      final pendingMembers = await _ref
          .watch(pendingMemberRepository)
          .retrievePendingMembers(groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(pendingMembers);
      }
      return pendingMembers;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> createPendingMember(
      {required PendingMember pendingMember, required String groupId}) async {
    try {
      final docRef = await _ref
          .watch(pendingMemberRepository)
          .createPendingMember(pendingMember: pendingMember, groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(docRef);
      }
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updatePendingMember(
      {required PendingMember pendingMember, required String groupId}) async {
    try {
      await _ref
          .watch(pendingMemberRepository)
          .updatePendingMember(pendingMember: pendingMember, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deletePendingMember(
      {required String pendingMemberId, required String groupId}) async {
    try {
      await _ref
          .watch(pendingMemberRepository)
          .deletePendingMember(pendingMemberId: pendingMemberId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
