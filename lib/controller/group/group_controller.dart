import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/firebase_user/firebase_user.dart';
import 'package:emo_project/model/group/group.dart';
import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/model/repository/firebase_user_repository.dart';
import 'package:emo_project/model/repository/group_repository.dart';
import 'package:emo_project/model/repository/member_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_controller.g.dart';

@riverpod
class GroupController extends _$GroupController {
  @override
  Future<Group?> build({required String userId}) async {
    final repository = ref.read(groupRepository);
    final groups = await repository.retrieveGroups(userId: userId);

    return groups.isEmpty ? null : groups.first;
  }

  void streamGroup() {
    ref.read(groupRepository).streamGroupList().then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<Group> latestGroupList =
            await ref.read(groupRepository).retrieveGroups(userId: userId);
        state = AsyncData(latestGroupList.first);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  Future<List<Group>> retriveGroups() async {
    final repository = ref.read(groupRepository);
    final groups = await repository.retrieveGroups(userId: userId);

    return groups;
  }

  Future<bool> createGroup({
    required String groupId,
    required String name,
    required String icon,
    required String description,
  }) async {
    // firebaseUser を取得
    final FirebaseUser firebaseUser =
        await ref.read(firebaseUserRepository).readCurrentFirebaseUser();

    final Member member = Member(
      memberId: firebaseUser.userId,
      name: name,
      role: "admin",
      icon: icon,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final group = Group(
      groupId: groupId,
      name: name,
      description: description,
      icon: icon,
      memberCount: 0,
      createdAt: DateTime.now(),
      updatedAt: null,
    );

    return await ref
        .read(groupRepository)
        .createGroup(
          member: member,
          group: group,
        )
        .then((value) async {
      print("group created");
      // グループ作成に成功したら、グループにメンバーを追加
      if (value) {
        await ref.read(memberRepository).createMember(
              member: member,
              groupId: groupId,
            );
      }
      return value;
    });
  }

  Future<void> updateGroup({required Group group}) async {
    try {
      await ref
          .read(groupRepository)
          .updateGroup(group: group.copyWith(updatedAt: DateTime.now()));
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  // グループ管理者しか呼び出せない
  Future<void> deleteGroup({
    required String groupId,
    required String userId,
  }) async {
    try {
      await ref.read(groupRepository).deleteGroup(
            groupId: groupId,
            userId: "",
          );
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
