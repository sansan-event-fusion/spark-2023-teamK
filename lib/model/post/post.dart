import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post({
    required String postId,
    required String memberId,
    required List<String> mentionedMemberList,
    required String description,
    required List<String> imageUrlList,
    required int likeCount,
    required DateTime createdAt,
  }) = _Post;

  factory Post.empty() => Post(
        postId: '',
        memberId: '',
        mentionedMemberList: [],
        description: '',
        imageUrlList: [],
        likeCount: 0,
        createdAt: DateTime.now(),
      );

  factory Post.mock() => Post(
        postId: 'mockPostId',
        memberId: 'mockMemberId',
        mentionedMemberList: [],
        description: 'mockDescription',
        imageUrlList: [],
        likeCount: 0,
        createdAt: DateTime.now(),
      );

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Post.fromJson(data).copyWith(postId: doc.id);
  }
}
