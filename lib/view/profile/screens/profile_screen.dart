import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール設定"),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text("プロフィール設定")),
    );
  }
}
