import 'package:flutter/material.dart';

class JoinGroupScreen extends StatelessWidget {
  const JoinGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("グループに参加"),
      ),
      body: const Center(
        child: Text("グループに参加"),
      ),
    );
  }
}
