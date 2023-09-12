import 'package:emo_project/controller/member/member_controller.dart';
import 'package:emo_project/model/member/member.dart';
import 'package:emo_project/view/auth/components/apple_signin_button.dart';
import 'package:emo_project/view/common/components/custom_textfield.dart';
import 'package:emo_project/view/auth/components/google_signin_button.dart';
import 'package:emo_project/view/auth/screens/login_screen.dart';
import 'package:emo_project/view/initial/screens/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final state = ref.watch(memberControllerProvider(groupId: "test"));
    return state.when(
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        data: (data) => Scaffold(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: deviceHeight * 0.05,
                        ),
                        SizedBox(
                          width: deviceWidth * 0.9,
                          child: const CustomTextField(
                            title: "メールアドレス",
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.04,
                        ),
                        SizedBox(
                          width: deviceWidth * 0.9,
                          child: const CustomTextField(
                            title: "パスワード",
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.04,
                        ),
                        SizedBox(
                          // height: 40,
                          width: deviceWidth * 0.9,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const InitialScreen(),
                                ),
                              );
                            },
                            child: const Text("新規登録"),
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
                        ElevatedButton(
                          onPressed: () async {
                            print(data.length);
                          },
                          child: Text("member list test"),
                        ),
                        Text(data.length.toString()),
                        ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(
                                      memberControllerProvider(groupId: "test")
                                          .notifier)
                                  .createMember(
                                      member: Member(
                                          memberId: "memberId2",
                                          name:
                                              "${DateTime.now().microsecond % 100}",
                                          role: "",
                                          icon: "icon2",
                                          description: "description2",
                                          createdAt: DateTime.now(),
                                          updatedAt: DateTime.now()));
                            },
                            child: const Text("add member"))
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
