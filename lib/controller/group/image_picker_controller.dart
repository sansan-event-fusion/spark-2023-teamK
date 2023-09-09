import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> pickImage(XFile? image) async {
    if (image == null) return;
    state = state.copyWith(imageFile: File(image.path));
  }
}