// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseUser _$$_FirebaseUserFromJson(Map<String, dynamic> json) =>
    _$_FirebaseUser(
      userId: json['userId'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      accountId: json['accountId'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_FirebaseUserToJson(_$_FirebaseUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'icon': instance.icon,
      'accountId': instance.accountId,
      'email': instance.email,
    };
