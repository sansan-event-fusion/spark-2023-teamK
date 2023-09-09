import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  const PostView(
      {super.key, required this.imageUrl, required this.mentionUserList, required this.description});

  final String imageUrl;
  final String description;
  final List<String> mentionUserList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Image.network(imageUrl, fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(alignment: Alignment.centerLeft, child: Text(description)),
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
      ]),
    );
  }
}
