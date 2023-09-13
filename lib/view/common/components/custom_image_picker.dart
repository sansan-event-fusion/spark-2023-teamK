import 'dart:io';
import 'package:emo_project/model/repository/auth_repository.dart';
import 'package:emo_project/providers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final imageProvider = StateProvider<File?>((ref) => null);

final uploadImageProvider = FutureProvider.autoDispose.family<String?, File>(
  (ref, file) async {
    const uuid = Uuid();
    final storageReference = FirebaseStorage.instance
        .ref()
        .child('icons/$uuid.png');
    await storageReference.putFile(file);
    return storageReference.getDownloadURL();
  },
);

class CustomImagePicker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(imageProvider.notifier).state;
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black12,
              child: CircleAvatar(
                radius: 118,
                backgroundImage: imageFile != null
                    ? Image.file(imageFile, fit: BoxFit.cover).image
                    : const AssetImage('assets/images/no_image.png'),
              ),
            ),
            RawMaterialButton(
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  ref.watch(imageProvider.notifier).state =
                      File(pickedFile.path);
                  final imageUrl = await ref
                      .watch(uploadImageProvider(File(pickedFile.path)).future);
                  if (imageUrl != null) {
                    final currentUser =
                        ref.watch(authRepositoryProvider).getCurrentUser();
                    ref
                        .watch(firebaseFirestoreProvider)
                        .collection("users")
                        .doc(currentUser!.uid)
                        .update({"icon": imageUrl});
                  }
                }
              },
              shape: const CircleBorder(),
              elevation: 0,
              child: const SizedBox(
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
