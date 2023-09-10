import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_picture.freezed.dart';
part 'album_picture.g.dart';

@freezed
class AlbumPicture with _$AlbumPicture {
  factory AlbumPicture({
    required String albumPictureId,
    required String pictureUrl,
  }) = _AlbumPicture;

  factory AlbumPicture.fromJson(Map<String, dynamic> json) =>
      _$AlbumPictureFromJson(json);
}
