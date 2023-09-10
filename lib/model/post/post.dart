import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String id,
    required List<String> imageUrlList,
    required String title,
    required String description,
    required DateTime createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Post.fromJson(data).copyWith(id: doc.id);
  }
}

extension PostX on Post {
  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
