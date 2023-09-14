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

class CustomRectangleImagePicker extends StatelessWidget {
  const CustomRectangleImagePicker(
      {required this.imagePickerController, required this.file, super.key});

  final ImagePickerController imagePickerController;
  final File? file;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: deviceWidth * 0.9,
              height: deviceWidth * 0.9,
              child: file != null
                  ? Image.file(file!, fit: BoxFit.cover)
                  : Image.asset("assets/images/no_image.png"),
            ),
            RawMaterialButton(
              onPressed: () async {
                imagePickerController.pickImage();
              },
              elevation: 0,
              child: SizedBox(
                width: deviceWidth * 0.9,
                height: deviceWidth * 0.9,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
