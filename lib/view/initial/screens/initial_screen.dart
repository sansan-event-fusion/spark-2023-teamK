import 'package:emo_project/controller/group/group_controller.dart';
import 'package:emo_project/model/group/group.dart';
import 'package:emo_project/providers.dart';
import 'package:emo_project/view/group/screens/add_group_screen.dart';
import 'package:emo_project/view/group/screens/join_group_screen.dart';
import 'package:emo_project/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupState = ref.watch(groupControllerProvider(
        userId: ref.read(firebaseAuthProvider).currentUser!.uid));

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
        if (data == null) return const _InitialScreen();
        return HomeScreen();
      },
    );
  }
}

class _InitialScreen extends StatelessWidget {
  const _InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ようこそ"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "画像を共有するグループを作成するか \n 既に作成されているグループに参加しましょう",
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddGroupScreen(),
                      ),
                    );
                  },
                  child: const Text("グループを作成"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinGroupScreen(),
                      ),
                    );
                  },
                  child: const Text("グループに参加"),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            )
          ],
        ),
      ),
    );
  }
}
