import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/model/repository/member_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_controller.g.dart';

@riverpod
class MemberController extends _$MemberController {
  @override
  Future<List<Member>> build({required String groupId}) async {
    final repository = ref.read(memberRepository);
    final members = await repository.getAllMemberList(groupId: groupId);

    Future(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      streamMemberList();
    });

    return members;
  }

  /// Member 監視
  void streamMemberList() {
    ref.read(memberRepository).streamMemberList(groupId: groupId).then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<Member> latestMemberList = await ref
            .read(memberRepository)
            .getLocalMemberList(groupId: groupId);
        state = AsyncData(latestMemberList);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  Future<void> updateMember({required Member member}) async {
    try {
      await ref.watch(memberRepository).updateMember(
            member: member,
            groupId: groupId,
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteMember({required String memberId}) async {
    try {
      await ref.watch(memberRepository).deleteMember(
            memberId: memberId,
            groupId: groupId,
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
