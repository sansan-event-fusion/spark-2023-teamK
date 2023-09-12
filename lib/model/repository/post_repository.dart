import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emo_project/model/post/post.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePostRepository {
  Future<String> createPost({
    required Post post,
    required String groupId,
  });
  Future<void> updatePost({
    required Post post,
    required String groupId,
  });
  Future<void> deletePost({
    required String postId,
    required String groupId,
  });
  Future<List<Post>> getAllPostList({
    required String groupId,
  });
  Future<List<Post>> getLocalPostList({
    required String groupId,
  });
  Future<Stream<QuerySnapshot<Post>>> streamPostList({
    required String groupId,
  });
}

final postRepository = Provider<PostRepository>((ref) => PostRepository(ref));

class PostRepository implements BasePostRepository {
  final Ref _ref;

  const PostRepository(this._ref);

  @override
  Future<List<Post>> getAllPostList({required String groupId}) async {
    return await getQuery(groupId: groupId).then((ref) async => await ref
        .get()
        .then((value) async => await getLocalPostList(groupId: groupId)));
  }

  @override
  Future<List<Post>> getLocalPostList({required String groupId}) async {
    final snap = await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("posts")
        .get(const GetOptions(source: Source.cache));
    return snap.docs.map((doc) => Post.fromDocument(doc)).toList();
  }

  Future<Query<Post>> getQuery({required String groupId}) async {
    DocumentSnapshot? lastDocRef;
    await _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("posts")
        .get(const GetOptions(source: Source.cache))
        .then((value) {
      if (value.docs.isNotEmpty) lastDocRef = value.docs.last;
    });

    Query<Post> ref = _ref
        .watch(firebaseFirestoreProvider)
        .collection("groups")
        .doc(groupId)
        .collection("posts")
        .withConverter(
          fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );
    if (lastDocRef != null) {
      ref = ref.orderBy("createdAt").startAtDocument(lastDocRef!);
    }

    return ref;
  }

  @override
  Future<Stream<QuerySnapshot<Post>>> streamPostList(
      {required String groupId}) async {
    final ref = await getQuery(groupId: groupId);
    return ref.snapshots();
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
