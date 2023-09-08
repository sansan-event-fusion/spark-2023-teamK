import 'package:flutter/material.dart';

class AddAlbumsScreen extends StatelessWidget {
  const AddAlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバムの追加"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("タイトルを入力"),
          Text("写真を追加"), // イメージピッカーが開く
          Text("日時を追加"),
        ],
      )),
    );
  }
}
