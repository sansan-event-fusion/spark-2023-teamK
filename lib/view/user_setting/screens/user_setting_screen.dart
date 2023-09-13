import 'package:emo_project/controller/user_setting/validator/user_setting_validator.dart';
import 'package:emo_project/model/repository/auth_repository.dart';
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
                      final isAllValid = ref
                          .read(userSettingValidatorProvider.notifier)
                          .isAllValid(
                            name: nameController.text,
                            userId: idController.text,
                          );
                      if (isAllValid) {
                        final currentUser =
                            ref.watch(authRepositoryProvider).getCurrentUser();
                        if (currentUser != null) {
                          // firebase user update
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InitialScreen(),
                            ),
                          );
                        }
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
