import 'package:emo_project/common/keys.dart';
import 'package:emo_project/controller/album/album_controller.dart';
import 'package:emo_project/controller/album_picture/album_picture_controller.dart';
import 'package:emo_project/controller/common/multi_image_picker_controller.dart';
import 'package:emo_project/model/album/album.dart';
import 'package:emo_project/providers.dart';
import 'package:emo_project/view/album/components/add_album_info_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddAlbumsScreen extends HookConsumerWidget {
  const AddAlbumsScreen({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final nameController = useTextEditingController();
    final multiImageState = ref.watch(multiImagePickerProvider);
    final multiImageController = ref.read(multiImagePickerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("アルバムの追加"),
      ),
      body: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: CustomScrollView(
          slivers: [
            AddAlbumInfoPart(
              nameController: nameController,
            ),
            SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
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
                return Image.file(
                  multiImageState.imageFileList[index - 1],
                  fit: BoxFit.cover,
                );
              },
              itemCount: multiImageState.imageFileList.length + 1,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 120),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(albumControllerProvider(groupId: groupId).notifier)
              .createAlbum(
                album: Album(
                  albumId: "",
                  name: nameController.text,
                  pictureCount: 0,
                  deletedPictureCount: 0,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              )
              .then((value) async {
            final imageUrls = await multiImageController.uploadImage(
                storagePath: Keys().getUserIconStoragePath());
            print(imageUrls);
            ref
                .read(albumPictureControllerProvider(
                        groupId: groupId, albumId: value)
                    .notifier)
                .createAlbumPicture(
                  albumId: value,
                  groupId: groupId,
                  memberId: ref.read(firebaseAuthProvider).currentUser!.uid,
                  pictureUrls: imageUrls,
                )
                .then((value) => Navigator.pop(context));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
