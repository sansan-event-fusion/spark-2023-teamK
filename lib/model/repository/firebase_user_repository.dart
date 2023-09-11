import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/firebase_user/firebase_user.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseFirebaseUserRepository {
  Future<List<FirebaseUser>> retrieveFirebaseUsers();
  Future<String> createFirebaseUser({required FirebaseUser firebaseUser});
  Future<void> updateFirebaseUser({required FirebaseUser firebaseUser});
  Future<void> deleteFirebaseUser({required String userId});
}

final firebaseUserRepository =
    Provider<FirebaseUserRepository>((ref) => FirebaseUserRepository(ref));

class FirebaseUserRepository implements BaseFirebaseUserRepository {
  final Ref _ref;

  const FirebaseUserRepository(this._ref);

  @override
  Future<List<FirebaseUser>> retrieveFirebaseUsers() async {
    try {
      final snap =
          await _ref.watch(firebaseFirestoreProvider).collection("users").get();
      return snap.docs.map((doc) => FirebaseUser.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createFirebaseUser(
      {required FirebaseUser firebaseUser}) async {
    try {
      final docRef =
          _ref.watch(firebaseFirestoreProvider).collection("users").doc();

      await docRef.set(firebaseUser.copyWith(userId: docRef.id).toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateFirebaseUser({required FirebaseUser firebaseUser}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("users")
          .doc(firebaseUser.userId)
          .update(firebaseUser.toDocument());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteFirebaseUser({required String userId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("users")
          .doc(userId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
