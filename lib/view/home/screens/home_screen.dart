import 'package:emo_project/controller/group/group_controller.dart';
import 'package:emo_project/model/group/group.dart';
import 'package:emo_project/providers.dart';
import 'package:emo_project/view/album/screens/albums_screen.dart';
import 'package:emo_project/view/group/screens/group_profile_screen.dart';
import 'package:emo_project/view/initial/screens/initial_screen.dart';
import 'package:emo_project/view/post/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final labels = [
    "ホーム",
    "アルバム",
    // "プロフィール",
    "グループ",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final selectedIndexNotifier = ref.watch(selectedIndexProvider.notifier);
    final currentUserId = ref.watch(firebaseAuthProvider).currentUser!.uid;
    final groupState =
        ref.watch(groupControllerProvider(userId: currentUserId));

    return groupState.when(
      error: (error, stackTrace) => const Scaffold(
        body: Center(
          child: Text("エラーが発生しました"),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      data: (Group? data) {
        print("groupData:" + data.toString());
        if (data == null) return const InitialScreen();
        final screens = [
          PostsScreen(groupId: data.groupId),
          AlbumsScreen(groupId: data.groupId),
          // const ProfileScreen(groupId: data.groupId),
          GroupProfileScreen(group: data),
        ];

        List<Widget> iconList = [
          const Icon(Icons.home),
          const Icon(Icons.photo_album),
          // const Icon(Icons.person),
          CircleAvatar(
            backgroundImage: NetworkImage(data.icon),
          ),
        ];
        return Scaffold(
          body: screens[selectedIndexNotifier.state],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black26,
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
      },
    );
  }
}
