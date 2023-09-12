import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/post/post.dart';
import 'package:emo_project/model/repository/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_controller.g.dart';

@riverpod
class PostController extends _$PostController {
  @override
  Future<List<Post>> build({required String groupId}) async {
    final repository = ref.read(postRepository);
    final posts = await repository.getAllPostList(groupId: groupId);

    Future(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      streamPostList();
    });

    return posts;
  }

  /// Post 監視
  void streamPostList() {
    ref.read(postRepository).streamPostList(groupId: groupId).then((value) {
      StreamSubscription<QuerySnapshot> streamSub = value.listen((event) async {
        List<Post> latestPostList =
            await ref.read(postRepository).getLocalPostList(groupId: groupId);
        state = AsyncData(latestPostList);
      });

      /// Snapshot キャンセル
      ref.onDispose(() => streamSub.cancel());
    });
  }

  List<Post> retrievePostByMemberId({required String memberId}) {
    final postList = state.value;
    if (postList == null) {
      return [];
    }
    return postList.where((post) => post.memberId == memberId).toList();
  }

  Future<String> createPost({required Post post}) async {
    try {
      final docRef = await ref
          .watch(postRepository)
          .createPost(post: post, groupId: groupId);
      return docRef;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updatePost({required Post post}) async {
    try {
      await ref.watch(postRepository).updatePost(post: post, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deletePost({required String postId}) async {
    try {
      await ref
          .watch(postRepository)
          .deletePost(postId: postId, groupId: groupId);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
