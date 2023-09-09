import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/model/picture/album_picture.dart';
import 'package:emo_project/view/album/components/album_thumbnail.dart';
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
      AlbumPicture(
          albumPictureId: '1', pictureUrl: 'https://picsum.photos/200'),
      AlbumPicture(
          albumPictureId: '2', pictureUrl: 'https://picsum.photos/300'),
      AlbumPicture(
          albumPictureId: '3', pictureUrl: 'https://picsum.photos/400'),
      AlbumPicture(
          albumPictureId: '4', pictureUrl: 'https://picsum.photos/500'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          album.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${albumPictures.length}枚',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const Text(
              '2021/09/01',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Placeholder(),
              ),
            );
          },
          child: AlbumThumbnail(albumPictures: albumPictures),
        ),
      ],
    );
  }
}
