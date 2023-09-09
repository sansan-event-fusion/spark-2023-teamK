import 'package:emo_project/view/album/screens/albums_screen.dart';
import 'package:emo_project/view/group/screens/group_profile_screen.dart';
import 'package:emo_project/view/post/screens/posts_screen.dart';
import 'package:emo_project/view/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const List<Icon> iconList = [
    Icon(Icons.home),
    Icon(Icons.photo_album),
    Icon(Icons.person),
    Icon(Icons.people) // TODO: このグループアイコンはグループで指定したアイコンにする
  ];

  final labels = [
    "ホーム",
    "アルバム",
    "プロフィール",
    "グループ",
  ];

  final screens = [
    PostsScreen(),
    AlbumsScreen(),
    ProfileScreen(),
    GroupProfileScreen(
      groupName: "グループ名",
      groupImage:
          'https://cdn.pixabay.com/photo/2018/06/11/21/50/road-bike-3469503_1280.jpg',
      groupDescription: 'グループの説明文',
    )
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final selectedIndexNotifier = ref.watch(selectedIndexProvider.notifier);

    return Scaffold(
      body: screens[selectedIndexNotifier.state],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          for (int i = 0; i < iconList.length; i++) ...{
            BottomNavigationBarItem(
              icon: iconList[i],
              label: labels[i],
            ),
          }
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          selectedIndexNotifier.state = index;
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
