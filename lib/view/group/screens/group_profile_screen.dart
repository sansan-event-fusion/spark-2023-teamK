import 'package:emo_project/controller/post/post_controller.dart';
import 'package:emo_project/view/member/screens/members_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupProfileScreen extends ConsumerWidget {
  GroupProfileScreen({
    super.key,
    required this.groupName,
    required this.groupImage,
    required this.groupDescription,
  });

  final String groupName;
  final String groupImage;
  final String groupDescription;
  final List<String> groupImageUrlList = [
    "https://cdn.pixabay.com/photo/2016/11/10/14/00/cycling-1814362_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/08/02/10/00/road-bikes-1562929_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/10/36/road-1833925_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/08/09/16/23/cyclists-5475979_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/10/06/07/56/girl-1718430_1280.jpg",
    "https://cdn.pixabay.com/photo/2013/03/19/18/23/mountain-biking-95032_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/04/26/17/58/road-bike-2263202_1280.jpg",
    "https://cdn.pixabay.com/photo/2018/06/11/21/50/road-bike-3469503_1280.jpg",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postControllerProvider(groupId: "test"));
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
                        {
                          "Hiroshi":
                              "https://cdn.pixabay.com/photo/2016/11/23/17/25/woman-1853939_1280.jpg"
                        }
                      ],
                      invitedMemberList: [
                        {
                          "Aoi":
                              "https://cdn.pixabay.com/photo/2016/04/24/20/56/man-1350599_1280.jpg"
                        },
                        {
                          "Yuji":
                              "https://cdn.pixabay.com/photo/2017/11/06/13/45/cap-2923682_1280.jpg"
                        },
                      ],
                      memberList: [
                        {
                          "Megumi":
                              "https://cdn.pixabay.com/photo/2018/04/27/08/55/water-3354062_1280.jpg"
                        },
                        {
                          "Taro":
                              "https://cdn.pixabay.com/photo/2017/12/31/15/56/portrait-3052641_1280.jpg"
                        },
                        {
                          "Jiro":
                              "https://cdn.pixabay.com/photo/2016/05/24/18/49/suitcase-1412996_1280.jpg"
                        },
                        {
                          "Saburo":
                              "https://cdn.pixabay.com/photo/2017/02/06/10/54/sad-2042536_1280.jpg"
                        },
                        {
                          "Goro":
                              "https://cdn.pixabay.com/photo/2016/11/21/12/42/beard-1845166_1280.jpg"
                        },
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.people))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                state.when(
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  data: (data) {
                    return Flexible(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.32,
                            height: MediaQuery.of(context).size.width * 0.32,
                            child: Image.network(
                              // 投稿の一番最初の画像のURLをサムネとして表示
                              data[index].imageUrlList.first,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
