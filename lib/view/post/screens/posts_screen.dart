import 'package:emo_project/controller/post/post_controller.dart';
import 'package:emo_project/view/post/components/post_card.dart';
import 'package:emo_project/view/post/screens/add_post_screen.dart';
import 'package:emo_project/view/post/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postControllerProvider(groupId: groupId));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("個人投稿"),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        data: (data) => ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailScreen(
                    post: data[index],
                  ),
                ),
              );
            },
            child: PostCard(post: data[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostScreen(groupId: groupId),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
