import 'package:emo_project/view/album/screens/add_album_screen.dart';
import 'package:emo_project/view/album/screens/pictures_screen.dart';
import 'package:flutter/material.dart';

final albumTitleList = [
  "沖縄旅行",
  "北海道旅行",
];

final thmbnailImgList = [];

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバム一覧"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PicturesScreen()),
              );
            },
            child: Container(
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAlbumsScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
