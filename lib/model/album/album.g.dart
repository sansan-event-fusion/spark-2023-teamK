// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      albumId: json['albumId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      pictureCount: json['pictureCount'] as int,
      deletedPictureCount: json['deletedPictureCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'name': instance.name,
      'description': instance.description,
      'pictureCount': instance.pictureCount,
      'deletedPictureCount': instance.deletedPictureCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
