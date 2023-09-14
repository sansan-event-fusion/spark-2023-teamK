import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

part 'image_picker_controller.freezed.dart';

@freezed
class ImagePickerState with _$ImagePickerState {
  const factory ImagePickerState({
    File? imageFile,
  }) = _ImagePickerState;
}

final imagePickerProvider =
    StateNotifierProvider.autoDispose<ImagePickerController, ImagePickerState>(
        (ref) {
  return ImagePickerController();
});

class ImagePickerController extends StateNotifier<ImagePickerState> {
  ImagePickerController() : super(const ImagePickerState());

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
  }

  Future<String?> uploadImage({required String storagePath}) async {
    if (state.imageFile == null) return null;
    const uuid = Uuid();
    //  storage path groups/groupId/posts/postId
    final storageReference =
        FirebaseStorage.instance.ref().child('$storagePath/${uuid.v4()}.png');
    await storageReference.putFile(state.imageFile!);
    state = state.copyWith(imageFile: null);
    return storageReference.getDownloadURL();
  }
}
