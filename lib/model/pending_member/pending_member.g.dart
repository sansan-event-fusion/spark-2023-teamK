// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingMember _$$_PendingMemberFromJson(Map<String, dynamic> json) =>
    _$_PendingMember(
      pendingMemberId: json['pendingMemberId'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_PendingMemberToJson(_$_PendingMember instance) =>
    <String, dynamic>{
      'pendingMemberId': instance.pendingMemberId,
      'name': instance.name,
      'icon': instance.icon,
      'createdAt': instance.createdAt.toIso8601String(),
    };
