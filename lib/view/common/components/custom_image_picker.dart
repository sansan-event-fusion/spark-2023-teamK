import 'dart:io';
import 'package:emo_project/controller/common/image_picker_controller.dart';
import 'package:flutter/material.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker(
      {required this.imagePickerController, required this.file, super.key});

  final ImagePickerController imagePickerController;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black12,
              child: CircleAvatar(
                radius: 118,
                backgroundImage: file != null
                    ? Image.file(file!, fit: BoxFit.cover).image
                    : const AssetImage('assets/images/no_image.png'),
              ),
            ),
            RawMaterialButton(
              onPressed: () async {
                imagePickerController.pickImage();
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

// class CustomRectangleImagePicker extends ConsumerWidget {
//   const CustomRectangleImagePicker({
//     super.key,
//     required this.storagePath,
//     required this.firestoreCollectionPath,
//     required this.firestoreDocumentId,
//   });

//   final String storagePath; // Cloud Storageの保存先パス
//   final String firestoreCollectionPath; // Firestoreのコレクションパス
//   final String firestoreDocumentId; // FirestoreのドキュメントID

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _imageFile = ref.watch(imageProvider.notifier).state;
//     Future<String?> uploadImage(File file) async {
//       const uuid = Uuid();
//       final storageReference =
//           FirebaseStorage.instance.ref().child('$storagePath/$uuid.png');
//       await storageReference.putFile(file);
//       return storageReference.getDownloadURL();
//     }

//     return Column(
//       children: [
//         Stack(
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.width * 0.9,
//               child: _imageFile != null
//                   ? Image.file(_imageFile, fit: BoxFit.cover)
//                   : Image.asset('assets/images/no_image.png'),
//             ),
//             RawMaterialButton(
//               onPressed: () async {
//                 final pickedFile =
//                     await ImagePicker().pickImage(source: ImageSource.gallery);
//                 if (pickedFile != null) {
//                   ref.watch(imageProvider.notifier).state =
//                       File(pickedFile.path);
//                   final imageUrl = await uploadImage(File(pickedFile.path));
//                   if (imageUrl != null) {
//                     ref
//                         .watch(firebaseFirestoreProvider)
//                         .collection(firestoreCollectionPath)
//                         .doc(firestoreDocumentId)
//                         .update({"icon": imageUrl});
//                   }
//                 }
//               },
//               shape: const CircleBorder(),
//               elevation: 0,
//               child: const SizedBox(
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }




// import 'dart:io';
// import 'package:emo_project/controller/group/image_picker_controller.dart';
// import 'package:emo_project/providers.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:uuid/uuid.dart';

// final imageProvider = StateProvider<File?>((ref) => null);

// class CustomImagePicker extends ConsumerWidget {
//   const CustomImagePicker({
//     super.key,
//     required this.storagePath,
//     required this.firestoreCollectionPath,
//     required this.firestoreDocumentId,
//   });

//   final String storagePath; // Cloud Storageの保存先パス
//   final String firestoreCollectionPath; // Firestoreのコレクションパス
//   final String firestoreDocumentId; // FirestoreのドキュメントID

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(imagePickerProvider);
//     final controller = ref.read(imagePickerProvider.notifier);

//     final _imageFile = ref.watch(imageProvider.notifier).state;
//     Future<String?> uploadImage(File file) async {
//       const uuid = Uuid();
//       final storageReference =
//           FirebaseStorage.instance.ref().child('$storagePath/$uuid.png');
//       await storageReference.putFile(file);
//       return storageReference.getDownloadURL();
//     }

//     return Column(
//       children: [
//         Stack(
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.black12,
//               child: CircleAvatar(
//                 radius: 118,
//                 backgroundImage: _imageFile != null
//                     ? Image.file(_imageFile, fit: BoxFit.cover).image
//                     : const AssetImage('assets/images/no_image.png'),
//               ),
//             ),
//             RawMaterialButton(
//               onPressed: () async {
//                 // pick
//                 final pickedFile =
//                     await ImagePicker().pickImage(source: ImageSource.gallery);

//                 // upload
//                 if (pickedFile != null) {
//                   ref.watch(imageProvider.notifier).state =
//                       File(pickedFile.path);
//                   final imageUrl = await uploadImage(File(pickedFile.path));
//                   if (imageUrl != null) {
//                     ref
//                         .watch(firebaseFirestoreProvider)
//                         .collection(firestoreCollectionPath)
//                         .doc(firestoreDocumentId)
//                         .update({"icon": imageUrl});
//                   }
//                 }
//               },
//               shape: const CircleBorder(),
//               elevation: 0,
//               child: const SizedBox(
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class CustomRectangleImagePicker extends ConsumerWidget {
//   const CustomRectangleImagePicker({
//     super.key,
//     required this.storagePath,
//     required this.firestoreCollectionPath,
//     required this.firestoreDocumentId,
//   });

//   final String storagePath; // Cloud Storageの保存先パス
//   final String firestoreCollectionPath; // Firestoreのコレクションパス
//   final String firestoreDocumentId; // FirestoreのドキュメントID

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _imageFile = ref.watch(imageProvider.notifier).state;
//     Future<String?> uploadImage(File file) async {
//       const uuid = Uuid();
//       final storageReference =
//           FirebaseStorage.instance.ref().child('$storagePath/$uuid.png');
//       await storageReference.putFile(file);
//       return storageReference.getDownloadURL();
//     }

//     return Column(
//       children: [
//         Stack(
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.9,
//               height: MediaQuery.of(context).size.width * 0.9,
//               child: _imageFile != null
//                   ? Image.file(_imageFile, fit: BoxFit.cover)
//                   : Image.asset('assets/images/no_image.png'),
//             ),
//             RawMaterialButton(
//               onPressed: () async {
//                 final pickedFile =
//                     await ImagePicker().pickImage(source: ImageSource.gallery);
//                 if (pickedFile != null) {
//                   ref.watch(imageProvider.notifier).state =
//                       File(pickedFile.path);
//                   final imageUrl = await uploadImage(File(pickedFile.path));
//                   if (imageUrl != null) {
//                     ref
//                         .watch(firebaseFirestoreProvider)
//                         .collection(firestoreCollectionPath)
//                         .doc(firestoreDocumentId)
//                         .update({"icon": imageUrl});
//                   }
//                 }
//               },
//               shape: const CircleBorder(),
//               elevation: 0,
//               child: const SizedBox(
//                 width: 100,
//                 height: 100,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
