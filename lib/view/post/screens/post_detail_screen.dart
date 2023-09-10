import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.mentionUserList});

  final String imageUrl;
  final String description;
  final List<String> mentionUserList;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "投稿詳細",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: deviceWidth,
              height: deviceWidth,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text(description)),
            ),
            Row(
              children: [
                for (int i = 0; i < mentionUserList.length; i++) ...{
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("@ ${mentionUserList[i]}"),
                  )
                }
              ],
            )
          ],
        ),
      ),
    );
  }
}
