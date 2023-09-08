import 'package:emo_project/view/home/screens/home_screen.dart';
import 'package:emo_project/view/post/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'メールアドレス',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'パスワード',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: const Text("ログイン")),
            ElevatedButton(
                onPressed: () {}, child: const Text("Google Sign In")),
          ],
        ),
      ),
    );
  }
}
