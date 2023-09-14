import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

part 'multi_image_picker_controller.freezed.dart';

@freezed
class MultiImagePickerState with _$MultiImagePickerState {
  const factory MultiImagePickerState({
    List<File>? imageFileList,
  }) = _MultiImagePickerState;
}

final multiImagePickerProvider = StateNotifierProvider.autoDispose<
    MultiImagePickerController, MultiImagePickerState>((ref) {
  return MultiImagePickerController();
});

class MultiImagePickerController extends StateNotifier<MultiImagePickerState> {
  MultiImagePickerController() : super(const MultiImagePickerState());

  Future<void> pickImage() async {
    final List<File> selectedImages = [];
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFiles;
    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
    }
    state = state.copyWith(imageFileList: selectedImages);
  }

  Future<List<String?>?> uploadImage({required String storagePath}) async {
    if (state.imageFileList == null) return null;
    final List<String> imageUrlList = [];
    for (int i = 0; i < state.imageFileList!.length; i++) {
      const uuid = Uuid();
      //  storage path groups/groupId/posts/postId
      final storageReference =
          FirebaseStorage.instance.ref().child('$storagePath/${uuid.v4()}.png');
      await storageReference.putFile(state.imageFileList![i]);
      imageUrlList.add(storageReference.getDownloadURL() as String);
    }
    return imageUrlList;
  }
}
