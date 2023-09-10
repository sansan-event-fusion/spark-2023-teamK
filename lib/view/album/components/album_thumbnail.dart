import 'package:cached_network_image/cached_network_image.dart';
import 'package:emo_project/model/picture/album_picture.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AlbumThumbnail extends StatelessWidget {
  const AlbumThumbnail({
    super.key,
    required this.albumPictures,
  });

  final List<AlbumPicture> albumPictures;

  @override
  Widget build(BuildContext context) {
    final double width =
        MediaQuery.of(context).size.width - 16 * 2; // 16: padding

    if (albumPictures.isEmpty) {
      return Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: LottieBuilder.asset(
          'assets/lottie/empty_album.json',
          width: 100,
          height: 100,
        ),
      );
    }

    if (albumPictures.length == 1) {
      return Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: CachedNetworkImageProvider(albumPictures[0].pictureUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    if (albumPictures.length == 2) {
      return Column(
        children: [
          Container(
            width: width,
            height: width / 2 - 1,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: CachedNetworkImageProvider(albumPictures[0].pictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 2),
          Container(
            width: width,
            height: width / 2 - 1,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(8)),
              image: DecorationImage(
                image: CachedNetworkImageProvider(albumPictures[1].pictureUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          width: width,
          height: width / 2 - 1,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            image: DecorationImage(
              image: CachedNetworkImageProvider(albumPictures[0].pictureUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Container(
              width: width / 2 - 1,
              height: width / 2 - 1,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                ),
                image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(albumPictures[1].pictureUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 2),
            Container(
              width: width / 2 - 1,
              height: width / 2 - 1,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(albumPictures[2].pictureUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
