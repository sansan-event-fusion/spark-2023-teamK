import 'package:emo_project/view/group/components/custom_image_picker.dart';
import 'package:emo_project/view/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AddGroupScreen extends StatelessWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("グループ作成"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("グループアイコン"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomImagePicker(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("グループ名"),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: "グループ名",
                      filled: true,
                      focusedBorder: UnderlineInputBorder()),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("グループプロフィール"),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                      hintText: "グループプロフィール",
                      filled: true,
                      focusedBorder: UnderlineInputBorder()),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: const Text("グループ作成"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
