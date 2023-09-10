import 'package:emo_project/view/group/screens/group_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<String> groupImageList = [
  "https://cdn.pixabay.com/photo/2016/11/10/14/00/cycling-1814362_1280.jpg",
  "https://cdn.pixabay.com/photo/2016/08/02/10/00/road-bikes-1562929_1280.jpg",
  "https://cdn.pixabay.com/photo/2016/11/18/10/36/road-1833925_1280.jpg",
  "https://cdn.pixabay.com/photo/2020/08/09/16/23/cyclists-5475979_1280.jpg",
  "https://cdn.pixabay.com/photo/2016/10/06/07/56/girl-1718430_1280.jpg",
  "https://cdn.pixabay.com/photo/2013/03/19/18/23/mountain-biking-95032_1280.jpg",
  "https://cdn.pixabay.com/photo/2017/04/26/17/58/road-bike-2263202_1280.jpg",
  "https://cdn.pixabay.com/photo/2018/06/11/21/50/road-bike-3469503_1280.jpg",
  "https://cdn.pixabay.com/photo/2020/08/09/16/23/cyclists-5475979_1280.jpg",
  "https://cdn.pixabay.com/photo/2016/11/10/14/00/cycling-1814362_1280.jpg",
];

final List<String> groupNameList = [
  "Group A",
  "Group B",
  "Group C",
  "Group D",
  "Group E",
  "Group F",
  "Group G",
  "Group H",
  "Group I",
  "Group J",
];

final List<String> groupIdList = [
  "12345A",
  "12345B",
  "12345C",
  "12345D",
  "12345E",
  "12345F",
  "12345G",
  "12345H",
  "12345I",
  "12345J",
];

final onSearchProvider = StateProvider((ref) => false);
final StateProvider<List<int>> searchIndexListProvider =
    StateProvider((ref) => []);

class JoinGroupScreen extends ConsumerWidget {
  const JoinGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSearchNotifier = ref.watch(onSearchProvider.notifier);
    final onSearch = ref.watch(onSearchProvider);
    final searchIndexListNotifier = ref.watch(searchIndexListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("グループに参加"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              onSearch
                  ? Expanded(child: _searchTextField(ref))
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          onSearchNotifier.state = true;
                          searchIndexListNotifier.state = [];
                        },
                        child: const Text("グループをIDで検索"),
                      ),
                    ),
              onSearch
                  ? IconButton(
                      onPressed: () {
                        onSearchNotifier.state = false;
                      },
                      icon: const Icon(Icons.clear))
                  : IconButton(
                      onPressed: () {
                        onSearchNotifier.state = true;
                        searchIndexListNotifier.state = [];
                      },
                      icon: const Icon(Icons.search),
                    ),
            ],
          ),
          onSearch ? _searchListView(ref) : _defaultListView(),
        ],
      ),
    );
  }

  Widget _searchTextField(WidgetRef ref) {
    final searchIndexListNotifier = ref.watch(searchIndexListProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: TextField(
        autofocus: true,
        onChanged: (String text) {
          searchIndexListNotifier.state = [];
          for (int i = 0; i < groupIdList.length; i++) {
            if (text == groupIdList[i]) {
              searchIndexListNotifier.state.add(i);
            }
          }
        },
      ),
    );
  }

  Widget _searchListView(WidgetRef ref) {
    final searchIndexListNotifier = ref.watch(searchIndexListProvider.notifier);
    final searchIndexList = ref.watch(searchIndexListProvider);
    return Flexible(
      child: ListView.builder(
          itemCount: searchIndexList.length,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            index = searchIndexListNotifier.state[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GroupProfileScreen(groupName: groupNameList[index]),
                    ),
                  );
                },
                leading: Image.network(
                  groupImageList[index],
                  width: 50,
                  height: 50,
                ),
                title: Text(groupNameList[index]),
                subtitle: Text(
                  "ID: ${groupIdList[index]}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            );
          }),
    );
  }

  Widget _defaultListView() {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: groupNameList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GroupProfileScreen(groupName: groupNameList[index]),
                  ),
                );
              },
              leading: Image.network(
                groupImageList[index],
                width: 50,
                height: 50,
              ),
              title: Text(groupNameList[index]),
            ),
          );
        },
      ),
    );
  }
}
