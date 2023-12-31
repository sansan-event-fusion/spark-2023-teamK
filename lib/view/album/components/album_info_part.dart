import 'package:emo_project/model/album/album.dart';
import 'package:flutter/material.dart';

class AlbumInfoPart extends StatelessWidget {
  const AlbumInfoPart({
    super.key,
    required this.album,
    required this.albumPicturesCount,
  });

  final Album album;
  final int albumPicturesCount;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0).copyWith(bottom: 8),
      sliver: SliverToBoxAdapter(
        child: Text(
          '$albumPicturesCount枚・2021/09/01',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}
