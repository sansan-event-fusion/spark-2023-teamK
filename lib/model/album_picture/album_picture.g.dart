// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AlbumPicture _$$_AlbumPictureFromJson(Map<String, dynamic> json) =>
    _$_AlbumPicture(
      albumPictureId: json['albumPictureId'] as String,
      memberId: json['memberId'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_AlbumPictureToJson(_$_AlbumPicture instance) =>
    <String, dynamic>{
      'albumPictureId': instance.albumPictureId,
      'memberId': instance.memberId,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };
