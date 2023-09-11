// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mention _$$_MentionFromJson(Map<String, dynamic> json) => _$_Mention(
      mentionId: json['mentionId'] as String,
      memberId: json['memberId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_MentionToJson(_$_Mention instance) =>
    <String, dynamic>{
      'mentionId': instance.mentionId,
      'memberId': instance.memberId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
