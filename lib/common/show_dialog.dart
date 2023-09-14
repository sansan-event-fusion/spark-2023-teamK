import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SD {
  static alertDialog({
    required BuildContext context,
    required String title,
    required String content,
    required String yesButtonText,
    required VoidCallback? yesButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title, textAlign: TextAlign.center),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "いいえ",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Builder(builder: (context) {
                return CupertinoDialogAction(
                  onPressed: yesButtonPressed,
                  child: Text(yesButtonText),
                );
              }),
            ],
          );
        }

        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("いいえ"),
            ),
            Builder(builder: (context) {
              return TextButton(
                onPressed: yesButtonPressed,
                child: Text(yesButtonText),
              );
            }),
          ],
        );
      },
    );
  }

  static oneChoiceAlert({
    required BuildContext context,
    required String titleText,
    required String contentText,
    String? oneText,
    VoidCallback? onPressed,
    bool needVibration = false,
  }) {
    if (needVibration) HapticFeedback.vibrate();
    showDialog(
      context: context,
      builder: (_) {
        return (Platform.isIOS)
            ? CupertinoAlertDialog(
                title: Text(titleText),
                content: Text(contentText),
                actions: [
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: onPressed ?? () => Navigator.pop(context),
                    child: Text(
                      oneText ?? "戻る",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            : AlertDialog(
                title: Text(
                  titleText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text(contentText),
                actions: [
                  TextButton(
                    onPressed: onPressed ?? () => Navigator.pop(context),
                    child: Text(oneText ?? "戻る"),
                  ),
                ],
              );
      },
    );
  }

  /// Circular表示
  static void circular(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration.zero, // これを入れると遅延を入れなくて済む
      barrierColor: Colors.black.withOpacity(0.25),
      pageBuilder: (
        BuildContext context,
        Animation animation,
        Animation secondaryAnimation,
      ) =>
          const Center(child: CircularProgressIndicator(color: Colors.blue)),
    );
  }

  static void drumScroll({
    required BuildContext context,
    required String title,
    required VoidCallback? onSavePressed,
    required Widget widget,
  }) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: size.height / 3,
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: onSavePressed,
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.pinkAccent),
                        child: const Text('保存'),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1, height: 0),
                ],
              ),
              Expanded(child: widget),
            ],
          ),
        );
      },
    );
  }

  static bottomSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16 * 2),
        ),
      ),
      isScrollControlled: true,
      builder: (builder) => child,
    );
  }
}
