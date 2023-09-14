import 'package:cached_network_image/cached_network_image.dart';
import 'package:emo_project/common/keys.dart';
import 'package:emo_project/controller/album_picture/album_picture_controller.dart';
import 'package:emo_project/controller/common/multi_image_picker_controller.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/model/album_picture/album_picture.dart';
import 'package:emo_project/providers.dart';
import 'package:emo_project/view/album/components/album_info_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlbumDetailsScreen extends ConsumerWidget {
  const AlbumDetailsScreen({
    super.key,
    required this.groupId,
    required this.album,
    required this.albumPictures,
  });

  final String groupId;
  final Album album;
  final List<AlbumPicture> albumPictures;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final multiImageState = ref.watch(multiImagePickerProvider);
    final multiImageController = ref.read(multiImagePickerProvider.notifier);
    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
      ),
      body: CustomScrollView(
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
            itemCount:
                albumPictures.length + multiImageState.imageFileList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () {
                    multiImageController.pickImage();
                  },
                  child: Container(
                    width: deviceWidth * 0.3,
                    height: deviceWidth * 0.3,
                    color: Colors.grey[300],
                    child: const Icon(Icons.add),
                  ),
                );
              }
              if (index <= albumPictures.length) {
                return CachedNetworkImage(
                  imageUrl: albumPictures[index - 1].imageUrl,
                  fit: BoxFit.cover,
                );
              }
              return Image.file(
                multiImageState.imageFileList[index - albumPictures.length - 1],
                fit: BoxFit.cover,
              );
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
        onPressed: () async {
          final imageUrls = await multiImageController.uploadImage(
              storagePath: Keys().getAlbumPictureStoragePath());
          ref
              .read(albumPictureControllerProvider(
                groupId: groupId,
                albumId: album.albumId,
              ).notifier)
              .createAlbumPicture(
                albumId: album.albumId,
                groupId: groupId,
                memberId: ref.read(firebaseAuthProvider).currentUser!.uid,
                pictureUrls: imageUrls,
              )
              .then((value) => Navigator.pop(context));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
