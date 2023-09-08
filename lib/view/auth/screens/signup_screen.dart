import 'package:emo_project/view/auth/components/apple_signin_button.dart';
import 'package:emo_project/view/auth/components/custom_textfield.dart';
import 'package:emo_project/view/auth/components/google_signin_button.dart';
import 'package:emo_project/view/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("新規登録"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const CustomTextField(
                    title: "メールアドレス",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const CustomTextField(
                    title: "パスワード",
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("新規登録"),
                  ),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  thickness: 0.5,
                  indent: MediaQuery.of(context).size.width * 0.05,
                  endIndent: MediaQuery.of(context).size.width * 0.05,
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "アカウントをお持ちの方はこちら",
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
