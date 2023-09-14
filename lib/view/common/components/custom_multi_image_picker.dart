import 'dart:io';

import 'package:emo_project/controller/common/multi_image_picker_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomMultiImagePicker extends StatefulWidget {
  final MultiImagePickerController multiImagePickerController;
  final List<File>? fileList;

  const CustomMultiImagePicker(
      {super.key, required this.multiImagePickerController, required this.fileList});

  @override
  State<CustomMultiImagePicker> createState() => _CustomMultiImagePickerState();
}

class _CustomMultiImagePickerState extends State<CustomMultiImagePicker> {
  List<File> selectedImages = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('画像追加'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text('カメラロールから選択'),
              onPressed: () {
                getImages();
              },
            ),
            Expanded(
              child: SizedBox(
                width: 300.0,
                child: selectedImages.isEmpty
                    ? const Center(child: Text('Sorry nothing selected!!'))
                    : GridView.builder(
                        itemCount: selectedImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: kIsWeb
                                ? Image.network(selectedImages[index].path)
                                : Image.file(
                                    selectedImages[index],
                                  ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    setState(
      () {
        if (xfilePick.isNotEmpty) {
          for (var i = 0; i < xfilePick.length; i++) {
            selectedImages.add(File(xfilePick[i].path));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
