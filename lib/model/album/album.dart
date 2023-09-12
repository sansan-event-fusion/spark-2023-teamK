import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'album.freezed.dart';
part 'album.g.dart';

@freezed
class Album with _$Album {
  factory Album({
    required String albumId,
    required String name,
    required int pictureCount,
    required int deletedPictureCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Album;

  factory Album.empty() => Album(
        albumId: '',
        name: '',
        pictureCount: 0,
        deletedPictureCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory Album.mock() => Album(
        albumId: 'albumMockId',
        name: 'albumMockName',
        pictureCount: 0,
        deletedPictureCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  factory Album.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Album.fromJson(data).copyWith(albumId: doc.id);
  }
}

extension AlbumX on Album {
  Map<String, dynamic> toDocument() => toJson()..remove('albumdId');
}
