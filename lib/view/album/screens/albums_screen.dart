import 'package:emo_project/controller/album/album_controller.dart';
import 'package:emo_project/view/album/components/album_card.dart';
import 'package:emo_project/view/album/screens/add_album_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumsScreen extends ConsumerWidget {
  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(albumControllerProvider(groupId: "test"));
    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバム一覧"),
        automaticallyImplyLeading: false,
      ),
      body: state.when(loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, data: (data) {
        return ListView.separated(
          padding: const EdgeInsets.all(16).copyWith(bottom: 80),
          itemCount: data.length,
          itemBuilder: (context, index) => AlbumCard(album: data[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        );
      }),
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
