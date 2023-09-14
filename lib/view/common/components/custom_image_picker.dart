import 'dart:io';
import 'package:emo_project/controller/common/image_picker_controller.dart';
import 'package:flutter/material.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    required this.imagePickerController,
    required this.file,
    super.key,
    this.isSquare = false,
  });

  final ImagePickerController imagePickerController;
  final File? file;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    if (isSquare) {
      final deviceWidth = MediaQuery.of(context).size.width;
      return Builder(builder: (context) {
        return GestureDetector(
          onTap: () async => await imagePickerController.pickImage(),
          child: Container(
            width: deviceWidth,
            height: deviceWidth * 0.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: file != null
                    ? Image.file(file!).image
                    : const AssetImage('assets/images/no_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      });
    }
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
              onPressed: () async => await imagePickerController.pickImage(),
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
