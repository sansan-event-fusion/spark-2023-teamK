import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/post/post.dart';
import 'package:emo_project/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePostRepository {
  Future<List<Post>> retrievePosts({required String groupId});
  Future<String> createPost({required Post post, required String groupId});
  Future<void> updatePost({required Post post, required String groupId});
  Future<void> deletePost({required String postId, required String groupId});
}

final postRepository = Provider<PostRepository>((ref) => PostRepository(ref));

class PostRepository implements BasePostRepository {
  final Ref _ref;

  const PostRepository(this._ref);

  @override
  Future<List<Post>> retrievePosts({required String groupId}) async {
    try {
      final snap = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("posts")
          .get();
      return snap.docs.map((doc) => Post.fromDocument(doc)).toList();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> createPost(
      {required Post post, required String groupId}) async {
    try {
      final docRef = await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("posts")
          .add(post.toDocument());
      return docRef.id;
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updatePost({required Post post, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("posts")
          .doc(post.postId)
          .update(post.toDocument());
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deletePost(
      {required String postId, required String groupId}) async {
    try {
      await _ref
          .watch(firebaseFirestoreProvider)
          .collection("groups")
          .doc(groupId)
          .collection("posts")
          .doc(postId)
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }
}
