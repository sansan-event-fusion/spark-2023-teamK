import 'package:emo_project/view/album/screens/pictures_screen.dart';
import 'package:emo_project/view/member/screens/members_screen.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MembersScreen(
                      requestedMemberList: [
                        {"Hiroshi" : "https://cdn.pixabay.com/photo/2016/11/23/17/25/woman-1853939_1280.jpg"}
                      ],
                      invitedMemberList: [
                        {"Aoi" : "https://cdn.pixabay.com/photo/2016/04/24/20/56/man-1350599_1280.jpg"},
                        {"Yuji" : "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_1280.jpg"},
                      ],
                      memberList: [
                        {"Megumi" : "https://cdn.pixabay.com/photo/2018/04/27/08/55/water-3354062_1280.jpg"},
                        {"Taro" : "https://cdn.pixabay.com/photo/2017/12/31/15/56/portrait-3052641_1280.jpg"},
                        {"Jiro" : "https://cdn.pixabay.com/photo/2016/05/24/18/49/suitcase-1412996_1280.jpg"},
                        {"Saburo" : "https://cdn.pixabay.com/photo/2017/02/06/10/54/sad-2042536_1280.jpg"},
                        {"Goro" : "https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_1280.jpg"},
                    ],),
                  ),
                );
              },
              icon: const Icon(Icons.people))
        ],
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
