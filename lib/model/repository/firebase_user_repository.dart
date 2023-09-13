import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/firebase_user/firebase_user.dart';
import 'package:emo_project/model/repository/auth_repository.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseFirebaseUserRepository {
  Future<String> createFirebaseUser({required FirebaseUser firebaseUser});
  Future<void> updateFirebaseUser({
    required String accountId,
    required String name,
    required String icon,
  });
  Future<void> deleteFirebaseUser({required String userId});
}

final firebaseUserRepository =
    Provider<FirebaseUserRepository>((ref) => FirebaseUserRepository(ref));

class FirebaseUserRepository implements BaseFirebaseUserRepository {
  final Ref _ref;

  const FirebaseUserRepository(this._ref);

  @override
  Future<String> createFirebaseUser(
      {required FirebaseUser firebaseUser}) async {
    try {
      final docRef = _ref
          .watch(firebaseFirestoreProvider)
          .collection("users")
          .doc(firebaseUser.userId);

      await docRef.set(firebaseUser.toJson());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateFirebaseUser({
    required String accountId,
    required String name,
    required String icon,
  }) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("users")
          .doc(_ref.read(authRepositoryProvider).getCurrentUser()!.uid)
          .update({
        "accountId": accountId,
        "name": name,
        "icon": icon,
          });
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  // アカウント削除した際の処理
  // TODO: BE api アカウント削除処理
  @override
  Future<void> deleteFirebaseUser({required String userId}) async {
    try {
      // user に紐づく post を削除

      // user に紐づく member を削除

      // user を削除
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
