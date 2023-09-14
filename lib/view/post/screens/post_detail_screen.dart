import 'package:emo_project/model/post/post.dart';
import 'package:emo_project/view/post/components/post_card.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "投稿詳細",
        ),
      ),
      body: PostCard(post: post),
    );
  }
}
