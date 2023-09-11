import 'package:emo_project/model/post/post.dart';
import 'package:emo_project/model/repository/post_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postControllerProvider = StateNotifierProvider((ref) {
  return PostController(ref);
});

class PostController extends StateNotifier {
  final Ref _ref;
  PostController(this._ref) : super(null);

  Future<List<Post>> retrievePosts({required String groupId}) async {
    try {
      final posts =
          await _ref.watch(postRepository).retrievePosts(groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(posts);
      }
      return posts;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String> createPost(
      {required Post post, required String groupId}) async {
    try {
      final docRef = await _ref
          .watch(postRepository)
          .createPost(post: post, groupId: groupId);
      if (mounted) {
        state = AsyncValue.data(docRef);
      }
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updatePost({required Post post, required String groupId}) async {
    try {
      await _ref
          .watch(postRepository)
          .updatePost(post: post, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deletePost({required String postId, required String groupId}) async {
    try {
      await _ref
          .watch(postRepository)
          .deletePost(postId: postId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}