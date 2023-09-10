// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseUser _$$_FirebaseUserFromJson(Map<String, dynamic> json) =>
    _$_FirebaseUser(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      email: json['email'] as String,
      userProfile: json['userProfile'] as String,
      userInvitationID: json['userInvitationID'] as String,
    );

Map<String, dynamic> _$$_FirebaseUserToJson(_$_FirebaseUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'email': instance.email,
      'userProfile': instance.userProfile,
      'userInvitationID': instance.userInvitationID,
    };
