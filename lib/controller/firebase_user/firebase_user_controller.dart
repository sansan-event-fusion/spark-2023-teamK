import 'package:emo_project/model/firebase_user/firebase_user.dart';
import 'package:emo_project/model/repository/firebase_user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseUserControllerProvider = StateNotifierProvider((ref) {
  return FirebaseUserController(ref);
});

class FirebaseUserController extends StateNotifier {
  final Ref _ref;
  FirebaseUserController(this._ref) : super(null);

  Future<String> createFirebaseUser({
    required String userId,
    required String email,
  }) async {
    try {
      final FirebaseUser firebaseUser = FirebaseUser(
        userId: userId,
        name: "",
        icon: "https://placehold.jp/150x150.png",
        accountId: "",
        email: email,
      );
      final docRef = await _ref
          .watch(firebaseUserRepository)
          .createFirebaseUser(firebaseUser: firebaseUser);
      if (mounted) {
        state = AsyncValue.data(docRef);
      }
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateFirebaseUser({required FirebaseUser firebaseUser}) async {
    try {
      await _ref
          .watch(firebaseUserRepository)
          .updateFirebaseUser(firebaseUser: firebaseUser.copyWith());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteFirebaseUser({required String userId}) async {
    try {
      await _ref
          .watch(firebaseUserRepository)
          .deleteFirebaseUser(userId: userId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
