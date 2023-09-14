import 'package:emo_project/model/post/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(
        children: [
          SizedBox(
            width: deviceWidth,
            height: deviceWidth * 0.8,
            child: Image.network(
              post.imageUrlList.first,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft, child: Text(post.description)),
          ),
          Row(
            children: [
              for (var mentionedMember in post.mentionedMemberList)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("@$mentionedMember"),
                )
            ],
          )
        ],
      ),
    );
  }
}
