import 'package:emo_project/controller/auth/auth_controller.dart';
import 'package:emo_project/model/repository/auth_repository.dart';
import 'package:emo_project/view/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.9,
      child: OutlinedButton(
        onPressed: () async {
          await ref.watch(authControllerProvider.notifier).signInWithGoogle();
          User? user = ref.watch(authRepositoryProvider).getCurrentUser();
          if (user != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/google_logo.png",
              width: 20,
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Googleで続ける",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
