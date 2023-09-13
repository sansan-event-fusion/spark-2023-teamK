import 'package:cached_network_image/cached_network_image.dart';
import 'package:emo_project/view/album/components/add_album_info_part.dart';
import 'package:flutter/material.dart';

class AddAlbumsScreen extends StatelessWidget {
  const AddAlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバムの追加"),
      ),
      body: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: CustomScrollView(
          slivers: [
            AddAlbumInfoPart(),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) => CachedNetworkImage(
                imageUrl: "https://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
              itemCount: 20,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 120),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
