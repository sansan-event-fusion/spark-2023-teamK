import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/pending_member/pending_member.dart';
import 'package:emo_project/model/repository/pending_member_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_member_controller.g.dart';

@riverpod
class PendingMemberController extends _$PendingMemberController {
  @override
  Future<List<PendingMember>> build({required String groupId}) async {
    final repository = ref.read(pendingMemberRepository);
    final pendingMembers =
        await repository.getAllPendingMemberList(groupId: groupId);

    Future(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      streamPendingMemberList();
    });

    return pendingMembers;
  }

  /// PendingMember 監視
  void streamPendingMemberList() {
    ref
        .read(pendingMemberRepository)
        .streamPendingMemberList(groupId: groupId)
        .then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<PendingMember> latestPendingMemberList = await ref
            .read(pendingMemberRepository)
            .getLocalPendingMemberList(groupId: groupId);
        state = AsyncData(latestPendingMemberList);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  Future<String> createPendingMember(
      {required PendingMember pendingMember}) async {
    try {
      final docRef =
          await ref.read(pendingMemberRepository).createPendingMember(
                pendingMember: pendingMember,
                groupId: groupId,
              );

      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> approvePendingMember({required String pendingMemberId}) async {
    try {
      await ref.read(pendingMemberRepository).approvePendingMember(
            pendingMemberId: pendingMemberId,
            groupId: groupId,
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deletePendingMember({required String pendingMemberId}) async {
    try {
      await ref.read(pendingMemberRepository).deletePendingMember(
            pendingMemberId: pendingMemberId,
            groupId: groupId,
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
