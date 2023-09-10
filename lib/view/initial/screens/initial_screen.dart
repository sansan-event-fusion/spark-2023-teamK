import 'package:emo_project/view/group/screens/add_group_screen.dart';
import 'package:emo_project/view/group/screens/join_group_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

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
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,)
          ],
        ),
      ),
    );
  }
}
