import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/group/group.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseGroupRepository {
  Future<List<Group>> retrieveGroups();
  Future<String> createGroup({required Group group});
  Future<void> updateGroup({required Group group});
  Future<void> deleteGroup({required String groupId});
}

final groupRepository =
    Provider<GroupRepository>((ref) => GroupRepository(ref));

class GroupRepository implements BaseGroupRepository {
  final Ref _ref;

  const GroupRepository(this._ref);

  @override
  Future<List<Group>> retrieveGroups() async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .get();
      return snap.docs.map((doc) => Group.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createGroup({required Group group}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(group.groupId);
      await docRef.set(group.copyWith(groupId: docRef.id).toJson());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateGroup({required Group group}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(group.groupId)
          .update(group.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteGroup({required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
