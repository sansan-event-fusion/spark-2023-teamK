import 'package:flutter/material.dart';

class AddGroupScreen extends StatelessWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("グループを作成"),
      ),
      body: const Center(
        child: Text("グループを作成"),
      ),
    );
  }
}
