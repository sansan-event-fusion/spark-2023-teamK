// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Member _$$_MemberFromJson(Map<String, dynamic> json) => _$_Member(
      id: json['id'] as String,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      name: json['name'] as String,
      userProfile: json['userProfile'] as String,
      userInvitationID: json['userInvitationID'] as String,
    );

Map<String, dynamic> _$$_MemberToJson(_$_Member instance) => <String, dynamic>{
      'id': instance.id,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'name': instance.name,
      'userProfile': instance.userProfile,
      'userInvitationID': instance.userInvitationID,
    };
