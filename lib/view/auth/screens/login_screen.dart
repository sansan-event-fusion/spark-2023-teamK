import 'package:emo_project/controller/auth/auth_controller.dart';
import 'package:emo_project/controller/auth/validator/login_validator.dart';
import 'package:emo_project/model/repository/auth_repository.dart';
import 'package:emo_project/view/auth/components/apple_signin_button.dart';
import 'package:emo_project/view/auth/screens/signup_screen.dart';
import 'package:emo_project/view/common/components/custom_textfield.dart';
import 'package:emo_project/view/auth/components/google_signin_button.dart';
import 'package:emo_project/view/initial/screens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ログイン"),
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
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: CustomTextField(
                    title: "メールアドレス",
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: CustomTextField(
                    title: "パスワード",
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.04,
                ),
                SizedBox(
                  width: deviceWidth * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      final isAllValid = ref
                          .read(loginValidatorProvider.notifier)
                          .isAllValid(
                              email: emailController.text,
                              password: passwordController.text);
                      if (isAllValid) {
                        ref
                            .watch(authControllerProvider.notifier)
                            .signInWithEmailAndPassword(
                                emailController.text, passwordController.text);
                        final currentUser =
                            ref.watch(authRepositoryProvider).getCurrentUser();
                        if (currentUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InitialScreen(),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text("ログイン"),
                  ),
                ),
                Divider(
                  height: deviceHeight * 0.08,
                  thickness: 0.5,
                  indent: deviceWidth * 0.05,
                  endIndent: deviceWidth * 0.05,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: GoogleSignInButton(),
                ),
                const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: AppleSignInButton(),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: deviceWidth * 0.9,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "新規登録はこちら",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
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
