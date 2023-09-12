import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_picture.freezed.dart';
part 'album_picture.g.dart';

@freezed
class AlbumPicture with _$AlbumPicture {
  factory AlbumPicture({
    required String albumPictureId,
    required String memberId,
    required String imageUrl,
    required DateTime createdAt,
  }) = _AlbumPicture;

  factory AlbumPicture.empty() => AlbumPicture(
        albumPictureId: '',
        memberId: '',
        imageUrl: '',
        createdAt: DateTime.now(),
      );

  factory AlbumPicture.fromJson(Map<String, dynamic> json) =>
      _$AlbumPictureFromJson(json);

  factory AlbumPicture.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return AlbumPicture.fromJson(data);
  }
}
