import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView(
      {super.key, required this.imageUrl, required this.mentionUserList});

  final String imageUrl;
  final List<String> mentionUserList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Image.network(imageUrl),
        ),
        Row(
          children: [
            for (int i = 0; i < mentionUserList.length; i++) ...{
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("@ ${mentionUserList[i]}"),
              )
            }
          ],
        )
      ]),
    );
  }
}
