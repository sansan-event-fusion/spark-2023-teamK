import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/view/album/components/album_card.dart';
import 'package:emo_project/view/album/screens/add_album_screen.dart';
import 'package:flutter/material.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Album> albums = [
      Album.empty(),
      Album.empty(),
      Album.empty(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバム一覧"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16).copyWith(bottom: 80),
        itemCount: albums.length,
        itemBuilder: (context, index) => AlbumCard(album: albums[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
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
