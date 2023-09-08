import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("新規登録"),
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
              onPressed: () {},
              child: const Text("新規登録"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Google Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
