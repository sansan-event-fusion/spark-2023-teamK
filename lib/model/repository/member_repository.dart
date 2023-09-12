import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseMemberRepository {
  Future<String> createMember(
      {required Member member, required String groupId});
  Future<void> updateMember({required Member member, required String groupId});
  Future<void> deleteMember(
      {required String memberId, required String groupId});
  Future<List<Member>> getAllMemberList({required String groupId});
  Future<List<Member>> getLocalMemberList({required String groupId});
  Future<Stream<QuerySnapshot<Member>>> streamMemberList(
      {required String groupId});
}

final memberRepository =
    Provider<MemberRepository>((ref) => MemberRepository(ref));

class MemberRepository implements BaseMemberRepository {
  final Ref _ref;

  const MemberRepository(this._ref);

  @override
  Future<List<Member>> getAllMemberList({required String groupId}) async {
    return await getQuery(groupId: groupId).then((ref) async => await ref
        .get()
        .then((value) async => await getLocalMemberList(groupId: groupId)));
  }

  @override
  Future<List<Member>> getLocalMemberList({required String groupId}) async {
    final snap = await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("members")
        .get(const GetOptions(source: Source.cache));
    return snap.docs.map((doc) => Member.fromDocument(doc)).toList();
  }

  Future<Query<Member>> getQuery({required String groupId}) async {
    DocumentSnapshot? lastDocRef;
    await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("members")
        .get(const GetOptions(source: Source.cache))
        .then((value) {
      if (value.docs.isNotEmpty) lastDocRef = value.docs.last;
    });

    Query<Member> ref = _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("members")
        .withConverter(
          fromFirestore: (snapshot, _) => Member.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastDocRef != null) {
      ref = ref.orderBy("updatedAt").startAtDocument(lastDocRef!);
    }

    return ref;
  }

  @override
  Future<Stream<QuerySnapshot<Member>>> streamMemberList(
      {required String groupId}) async {
    final ref = await getQuery(groupId: groupId);
    return ref.snapshots();
  }

  @override
  Future<String> createMember(
      {required Member member, required String groupId}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc();
      await docRef.set(member.copyWith(memberId: docRef.id).toJson());

      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateMember(
      {required Member member, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc(member.memberId)
          .update(member.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteMember(
      {required String memberId, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("members")
          .doc(memberId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
