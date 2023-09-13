import 'package:emo_project/controller/group/group_controller.dart';
import 'package:emo_project/model/firebase_user/firebase_user.dart';
import 'package:emo_project/view/common/components/custom_image_picker.dart';
import 'package:emo_project/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddGroupScreen extends HookConsumerWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    final mockUser = FirebaseUser.mock();
    final idController = useTextEditingController();
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("グループ作成"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("グループアイコン"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomImagePicker(),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("グループID"),
          ),
          Center(
            child: SizedBox(
              width: deviceWidth * 0.9,
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                    hintText: "グループID",
                    filled: true,
                    focusedBorder: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("グループ名"),
          ),
          Center(
            child: SizedBox(
              width: deviceWidth * 0.9,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "グループ名",
                    filled: true,
                    focusedBorder: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.04,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("グループプロフィール"),
          ),
          Center(
            child: SizedBox(
              width: deviceWidth * 0.9,
              child: TextField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                    hintText: "グループプロフィール",
                    filled: true,
                    focusedBorder: UnderlineInputBorder()),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.06,
          ),
          Center(
            child: SizedBox(
              width: deviceWidth * 0.9,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(groupControllerProvider(userId: mockUser.userId)
                          .notifier)
                      .createGroup(
                        groupId: idController.text,
                        icon: "https://picsum.photos/200/300",
                        name: nameController.text,
                        description: descriptionController.text,
                      )
                      .then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("グループを作成しました"),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("グループの作成に失敗しました"),
                        ),
                      );
                    }
                  });
                },
                child: const Text("グループ作成"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
