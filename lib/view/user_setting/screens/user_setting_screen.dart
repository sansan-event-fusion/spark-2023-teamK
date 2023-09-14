import 'package:emo_project/common/keys.dart';
import 'package:emo_project/common/show_dialog.dart';
import 'package:emo_project/controller/common/image_picker_controller.dart';
import 'package:emo_project/controller/firebase_user/firebase_user_controller.dart';
import 'package:emo_project/controller/user_setting/validator/user_setting_validator.dart';
import 'package:emo_project/model/repository/auth_repository.dart';
import 'package:emo_project/view/common/components/custom_image_picker.dart';
import 'package:emo_project/view/common/components/custom_textfield.dart';
import 'package:emo_project/view/initial/screens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserSettingScreen extends HookConsumerWidget {
  const UserSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final imageController = ref.read(imagePickerProvider.notifier);
    final imageState = ref.watch(imagePickerProvider);
    final nameController = useTextEditingController();
    final idController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("初期設定"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                // CustomImagePicker(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CustomImagePicker(
                        imagePickerController: imageController,
                        file: imageState.imageFile,
                      ),
                    )),
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: CustomTextField(
                    title: "ニックネーム",
                    controller: nameController,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: CustomTextField(
                    title: "ユーザーID（6文字以上）",
                    controller: idController,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: ElevatedButton(
                    onPressed: () async {
                      SD.circular(context);
                      final bool isAllValid = ref
                          .read(userSettingValidatorProvider.notifier)
                          .isAllValid(
                            name: nameController.text,
                            userId: idController.text,
                          );
                      if (isAllValid) {
                        final currentUser =
                            ref.watch(authRepositoryProvider).getCurrentUser();
                        // TODO: currentUser が null の時の処理
                        if (currentUser == null) return;
                        final storagePath = Keys().getUserIconStoragePath();
                        // TODO: imageUrl == null のときの処理
                        final String? imageUrl = await imageController
                            .uploadImage(storagePath: storagePath);
                        // firebase user update
                        await ref
                            .read(firebaseUserControllerProvider.notifier)
                            .updateFirebaseUser(
                              accountId: idController.text,
                              icon: imageUrl ??
                                  'https://placehold.jp/200x200.png',
                              name: nameController.text,
                            )
                            .then((value) {
                          Navigator.pop(context); // circular分
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InitialScreen(),
                              ));
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("入力内容に誤りがあります"),
                          ),
                        );
                      }
                    },
                    child: const Text("設定完了"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
