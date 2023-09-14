import 'package:emo_project/controller/album_picture/album_picture_controller.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/view/album/components/album_thumbnail.dart';
import 'package:emo_project/view/album/screens/album_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumCard extends ConsumerWidget {
  const AlbumCard({
    super.key,
    required this.album,
    required this.groupId,
  });

  final Album album;
  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(albumPictureControllerProvider(
        albumId: album.albumId, groupId: groupId));

    return state.when(loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }, data: (data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  album.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${data.length}枚・2021/09/01',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailsScreen(
                    album: album,
                    albumPictures: data,
                    groupId: groupId,
                  ),
                ),
              );
            },
            child: AlbumThumbnail(albumPictures: data),
          ),
        ],
      );
    });
  }
}
