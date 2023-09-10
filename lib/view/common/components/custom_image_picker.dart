import 'package:emo_project/controller/group/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends ConsumerWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(imagePickerProvider.select((s) => s.imageFile));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black12,
              child: CircleAvatar(
                radius: 118,
                //もしimageFile(image_pickerで選択した画像)があれば、それを表示
                //無ければ、別の画像を表示
                backgroundImage: imageFile != null
                    ? Image.file(imageFile, fit: BoxFit.cover).image
                    : const AssetImage('assets/images/no_image.png'),
              ),
            ),
            //RawMaterialButtonでCircleAvatarをtapできるようにしている
            RawMaterialButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                await ref.read(imagePickerProvider.notifier).pickImage(image);
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
