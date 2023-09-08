import 'package:flutter/material.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバムの追加"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("写真を追加"),
          Text("説明文を追加"), // イメージピッカーが開く
          TextButton(onPressed: () {}, child: const Text("メンバーを追加"))
        ],
      )),
    );
  }
}
