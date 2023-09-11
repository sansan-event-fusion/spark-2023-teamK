import 'package:cached_network_image/cached_network_image.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/model/picture/album_picture.dart';
import 'package:emo_project/view/album/components/album_info_part.dart';
import 'package:flutter/material.dart';

class AlbumDetailsScreen extends StatelessWidget {
  const AlbumDetailsScreen({
    super.key,
    required this.album,
    required this.albumPictures,
  });

  final Album album;
  final List<AlbumPicture> albumPictures;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
      ),
      body: albumPictures.isEmpty
          ? const Center(
              child: Text(
                '写真がありません \n 右下のボタンから写真を追加しよう！',
                textAlign: TextAlign.center,
              ),
            )
          : CustomScrollView(
              controller: scrollController,
              slivers: [
                AlbumInfoPart(
                  album: album,
                  albumPicturesCount: albumPictures.length,
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: albumPictures.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                        imageUrl: albumPictures[index].pictureUrl);
                  },
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 120,
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: アルバムに写真を追加する処理
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
