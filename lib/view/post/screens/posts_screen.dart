import 'package:emo_project/view/post/components/post_card.dart';
import 'package:emo_project/view/post/screens/add_post_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("個人投稿"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            PostView(
                imageUrl:
                    "https://images.unsplash.com/photo-1631276893368-554b60393efb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                mentionUserList: ["Yuki", "Koichi"]),
            PostView(
                imageUrl:
                    "https://images.unsplash.com/photo-1605050825077-289f85b6cf43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                mentionUserList: ["Taro"]),
            PostView(
                imageUrl:
                    "https://images.unsplash.com/photo-1600403477955-2b8c2cfab221?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                mentionUserList: ["Jiro", "Saburou", "Ryo"])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPostScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
