import 'package:emo_project/common/keys.dart';
import 'package:emo_project/controller/common/image_picker_controller.dart';
import 'package:emo_project/controller/member/member_controller.dart';
import 'package:emo_project/controller/post/post_controller.dart';
import 'package:emo_project/model/post/post.dart';
import 'package:emo_project/view/common/components/custom_image_picker.dart';
import 'package:emo_project/view/member/components/member_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostScreen extends ConsumerWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final state = ref.watch(memberControllerProvider(groupId: "test"));
    final imageState = ref.watch(imagePickerProvider);
    final imageController = ref.read(imagePickerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿の追加"),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("写真を追加"),
          ),
          CustomImagePicker(
            imagePickerController: imageController,
            file: imageState.imageFile,
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("詳細を追加"),
          ),
          //TODO: CustomTextField がマージされた後にここを変更して、簡略化する
          SizedBox(
            width: deviceWidth * 0.9,
            child: const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                hintText: "詳細",
                filled: true,
                focusedBorder: UnderlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          // TODO: グループメンバーをリストに
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Container(
                    height: 400,
                    color: Colors.white,
                    child: SingleChildScrollView(
                        child: state.when(
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      error: (error, stackTrace) {
                        return Text(error.toString());
                      },
                      data: (data) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for (int i = 0; i < data.length; i++) ...{
                                MemberListItem(
                                  memberImageUrl: data[i].icon,
                                  memberName: data[i].name,
                                )
                              }
                            ],
                          ),
                        );
                      },
                    )),
                  );
                },
              );
            },
            child: const Text("メンションするメンバーを追加"),
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          SizedBox(
            width: deviceWidth * 0.9,
            child: ElevatedButton(
              onPressed: () async {
                // TODO: createPost のテスト
                // TODO: 複数枚アップロードに変更
                // TODO: 画像アップロード失敗時の処理
                // TODO: groupId, postId を変数か
                final storagePath = Keys()
                    .getPostStoragePath(groupId: 'test', postId: 'postId');
                final String? imageUrl =
                    await imageController.uploadImage(storagePath: storagePath);
                if (imageUrl == null) return;
                await ref
                    .read(postControllerProvider(groupId: "test").notifier)
                    .createPost(
                      post: Post(
                        postId: "postId",
                        memberId: "memberId",
                        mentionedMemberList: [],
                        description: "description",
                        imageUrlList: [imageUrl],
                        likeCount: 0,
                        createdAt: DateTime.now(),
                      ),
                    )
                    .then((value) {
                  Navigator.pop(context);
                });
              },
              child: const Text("投稿する"),
            ),
          ),
        ],
      )),
    );
  }
}
