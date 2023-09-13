import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_user.freezed.dart';
part 'firebase_user.g.dart';

@freezed
class FirebaseUser with _$FirebaseUser {
  factory FirebaseUser({
    required String userId,
    required String name,
    required String icon,
    required String accountId,
    required String email,
  }) = _FirebaseUser;

  factory FirebaseUser.empty() => FirebaseUser(
        userId: '',
        name: '',
        icon: '',
        accountId: '',
        email: '',
      );

  factory FirebaseUser.mock() => FirebaseUser(
        userId: 'mockUserId',
        name: 'mockname',
        icon: 'https://picsum.photos/200/300',
        accountId: 'mockAccountId',
        email: 'mockEmail@gmail.com',
      );

  factory FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserFromJson(json);

  factory FirebaseUser.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return FirebaseUser.fromJson(data).copyWith(userId: doc.id);
  }
}

extension FirebaseUserX on FirebaseUser {
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
