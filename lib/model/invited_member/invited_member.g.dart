// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invited_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvitedMember _$$_InvitedMemberFromJson(Map<String, dynamic> json) =>
    _$_InvitedMember(
      invitedMemberId: json['invitedMemberId'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_InvitedMemberToJson(_$_InvitedMember instance) =>
    <String, dynamic>{
      'invitedMemberId': instance.invitedMemberId,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt.toIso8601String(),
    };
