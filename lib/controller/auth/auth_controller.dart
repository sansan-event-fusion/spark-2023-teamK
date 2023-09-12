import 'dart:async';
import 'package:emo_project/model/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
    (ref) => AuthController(ref)..appStarted());

class AuthController extends StateNotifier<User?> {
  final Ref _ref;
  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._ref) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _ref
        .watch(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void appStarted() async {
    final user = _ref.watch(authRepositoryProvider).getCurrentUser();
    if (user == null) {}
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await _ref
        .watch(authRepositoryProvider)
        .createUserWithEmailAndPassword(email, password);
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    User? user = await _ref
        .watch(authRepositoryProvider)
        .signInWithEmailAndPassword(email, password);
    return user;
  }

  Future<User?> signInWithGoogle() async {
    User? user = await _ref.watch(authRepositoryProvider).signInWithGoogle();
    return user;
  }

  Future<User?> signInWithApple() async {
    User? user = await _ref.watch(authRepositoryProvider).signInWithApple();
    return user;
  }

  Future<void> signOut() async {
    await _ref.watch(authRepositoryProvider).signOut();
  }
}
