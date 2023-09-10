import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_user.freezed.dart';
part 'firebase_user.g.dart';

@freezed
class FirebaseUser with _$FirebaseUser {
  factory FirebaseUser({
    required String id,
    required DateTime createdAt,
    required String email,
    required String userProfile,
    required String userInvitationID,
  }) = _FirebaseUser;

  factory FirebaseUser.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserFromJson(json);

  factory FirebaseUser.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return FirebaseUser.fromJson(data).copyWith(id: doc.id);
  }
}

extension FirebaseUserX on FirebaseUser {
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}