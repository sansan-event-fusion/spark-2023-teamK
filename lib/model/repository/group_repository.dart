import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:emo_project/model/group/group.dart';
import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseGroupRepository {
  Future<List<Group>> retrieveGroups({required String userId});
  Future<bool> createGroup({
    required Member member,
    required Group group,
  });
  Future<void> updateGroup({required Group group});
  Future<void> deleteGroup({
    required String groupId,
    required String userId,
  });
  Future<Stream<dynamic>> streamGroupList();
}

final groupRepository =
    Provider<GroupRepository>((ref) => GroupRepository(ref));

class GroupRepository implements BaseGroupRepository {
  final Ref _ref;

  const GroupRepository(this._ref);

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> streamGroupList() async {
    return _ref
        .watch(firebaseFirestoreProvider)
        .collection("users")
        .doc(_ref.read(firebaseAuthProvider).currentUser!.uid)
        .collection("groups")
        .snapshots()
        .map((event) => event);
  }

  @override
  Future<List<Group>> retrieveGroups({required String userId}) async {
    try {
      // users/{userId}/groups から groupIdList を取得
      final List<String> groupIdList = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("users")
          .doc(userId)
          .collection("groups")
          .get()
          .then((value) {
        final List<String> groupIdList = [];
        for (var element in value.docs) {
          groupIdList.add(element.data()["groupId"]);
        }
        return groupIdList;
      });

      // groupIdList から group を取得
      final List<Group> groupList = [];
      for (var groupId in groupIdList) {
        final group = await _ref
            .watch(firebaseFirestoreProvider)
            .collection("groups")
            .doc(groupId)
            .get()
            .then((value) => Group.fromDocument(value));
        groupList.add(group);
      }

      return groupList;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> createGroup({
    required Member member,
    required Group group,
  }) async {
    try {
      return _ref
          .read(firebaseFirestoreProvider)
          .runTransaction((transaction) async {
        final groupDoc = await transaction
            .get(
              _ref
                  .watch(firebaseFirestoreProvider)
                  .collection("groups")
                  .doc(group.groupId),
            )
            .then((value) => value);
        // group が存在するか確認
        if (groupDoc.exists) {
          return false;
        }
        // group が存在しない場合、group を作成
        transaction.set(
            _ref
                .watch(firebaseFirestoreProvider)
                .collection("groups")
                .doc(group.groupId),
            group.toJson());
        return true;
      });
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
  Future<bool> deleteGroup({
    required String groupId,
    required String userId,
  }) async {
    try {
      final result =
          await FirebaseFunctions.instance.httpsCallable('deleteGroup').call(
        {
          "groupId": groupId,
          "userId": userId,
        },
      );
      print(result.data);
      return result.data["success"] == "true";
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
