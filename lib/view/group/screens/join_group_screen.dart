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
];

final List<String> groupNameList = [
  "アドベンチャーシーカーズ",
  "ペダルパラダイス",
  "サイクルコネクト",
  "ツアーデキャンパス",
  "ペダルパワーアカデミー",
  "ビロンガク部",
  "サイクルサイエンスクラブ",
  "無限のペダルクルー",
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
];

final List<String> groupDescriptionList = [
  "「アドベンチャーシーカーズ」は、自転車を通じて新しい場所を発見し、自分自身の限界を挑戦することを愛する学生たちのグループです。週末のロングライドから、初心者向けの講習まで、一緒に自転車の世界を楽しみましょう！",
  "当サークルは、都市の中心から山の頂上まで、ペダルを踏むことの楽しさを共有するための場所です。経験豊富なライダーから初心者まで、全員が歓迎されます。",
  "学内で最もフレンドリーな自転車愛好者のコミュニティを作ることを目指しています。友情、健康、そして冒険を求めるすべての学生を歓迎します！",
  "このキャンパスをベースに、我々は周辺の風景や道を探索します。学業と健康をバランス良く維持したい学生のための、究極のサークル活動です。",
  "自転車の技術からメンテナンス、そしてレース戦略まで、ここでは自転車に関するすべてを学べます。一緒に次のレベルへと進みましょう！",
  "サイクリングはただの運動ではありません、それは生き方です。私たちはそれを全力で楽しむためのグループです。",
  "ここでは、自転車の力学や科学を深く探求します。サイクリングが好きで、その背後にある科学に興味がある学生に最適です。",
  "当サークルは、自転車と共に限界を超える喜びを追求する仲間たちのコミュニティです。毎週のグループライドやイベントで、自転車の楽しさを共有しましょう！",
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            onSearch
                ? Expanded(child: _searchTextField(ref))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        onSearchNotifier.state = true;
                        searchIndexListNotifier.state = [];
                      },
                      child: const Text("グループIDで参加するグループを検索"),
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
          ]),
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
          for (int i = 0; i < groupNameList.length; i++) {
            if (groupIdList[i] == text) {
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
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, int index) {
            index = searchIndexListNotifier.state[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupProfileScreen(),
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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: groupNameList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupProfileScreen(),
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
