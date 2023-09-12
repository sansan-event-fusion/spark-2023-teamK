import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/model/album_picture/album_picture.dart';
import 'package:emo_project/view/album/components/album_thumbnail.dart';
import 'package:emo_project/view/album/screens/album_details_screen.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    super.key,
    required this.album,
  });

  final Album album;

  @override
  Widget build(BuildContext context) {
    List<AlbumPicture> albumPictures = [
      AlbumPicture.mock(),
      AlbumPicture.mock(),
      AlbumPicture.mock(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                album.name * 8,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${albumPictures.length}枚・2021/09/01',
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
                  albumPictures: [
                    ...albumPictures,
                    ...albumPictures,
                    ...albumPictures,
                    ...albumPictures,
                    ...albumPictures,
                    ...albumPictures,
                  ],
                ),
              ),
            );
          },
          child: AlbumThumbnail(albumPictures: albumPictures),
        ),
      ],
    );
  }
}
