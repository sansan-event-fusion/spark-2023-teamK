import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/group/group.dart';
import 'package:emo_project/model/repository/group_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_controller.g.dart';

@riverpod
class GroupController extends _$GroupController {
  @override
  Future<List<Group>> build({required String userId}) async {
    final repository = ref.read(groupRepository);
    final groups = await repository.retrieveGroups(userId: userId);

    return groups;
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
    final group = Group(
      groupId: groupId,
      name: name,
      description: description,
      icon: icon,
      memberCount: 0,
      createdAt: DateTime.now(),
      updatedAt: null,
    );

    return await ref.read(groupRepository).createGroup(group: group);
  }

  Future<void> updateGroup({required Group group}) async {
    try {
      await ref.read(groupRepository).updateGroup(group: group);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteGroup({required String groupId}) async {
    try {
      await ref.read(groupRepository).deleteGroup(groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
