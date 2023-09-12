import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/invited_member/invited_member.dart';
import 'package:emo_project/model/repository/invited_member_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invited_member_controller.g.dart';

@riverpod
class MemberController extends _$MemberController {
  @override
  Future<List<InvitedMember>> build({required String groupId}) async {
    final repository = ref.read(invitedMemberRepository);
    final invitedMembers =
        await repository.getAllInvitedMemberList(groupId: groupId);

    Future(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      streamInvitedMemberList();
    });

    return invitedMembers;
  }

  /// InvitedMember 監視
  void streamInvitedMemberList() {
    ref
        .read(invitedMemberRepository)
        .streamInvitedMemberList(groupId: groupId)
        .then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<InvitedMember> latestInvitedMemberList = await ref
            .read(invitedMemberRepository)
            .getLocalInvitedMemberList(groupId: groupId);
        state = AsyncData(latestInvitedMemberList);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  Future<String> createInvitedMember({
    required InvitedMember invitedMember,
    required String groupId,
  }) async {
    try {
      final docRef = await ref
          .read(invitedMemberRepository)
          .createInvitedMember(invitedMember: invitedMember, groupId: groupId);

      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateInvitedMember({
    required InvitedMember invitedMember,
    required String groupId,
  }) async {
    try {
      await ref
          .read(invitedMemberRepository)
          .updateInvitedMember(invitedMember: invitedMember, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteInvitedMember({
    required String invitedMemberId,
    required String groupId,
  }) async {
    try {
      await ref.read(invitedMemberRepository).deleteInvitedMember(
          invitedMemberId: invitedMemberId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
