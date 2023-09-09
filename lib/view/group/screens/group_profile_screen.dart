import 'package:emo_project/view/album/screens/pictures_screen.dart';
import 'package:flutter/material.dart';

class GroupProfileScreen extends StatelessWidget {
  const GroupProfileScreen({
    super.key,
    required this.groupName,
    required this.groupImage,
    required this.groupDescription,
  });

  final String groupName;
  final String groupImage;
  final String groupDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    groupImage,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(groupName),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(groupDescription),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("投稿一覧"),
            ),
          ),
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: albumImageUrlList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: Image.network(
                      albumImageUrlList[index],
                      fit: BoxFit.cover,
                    ));
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
