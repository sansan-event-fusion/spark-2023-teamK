import 'package:emo_project/view/common/components/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddAlbumInfoPart extends StatelessWidget {
  const AddAlbumInfoPart({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: nameController,
              title: "2022/01/01",
              helperText: "アルバム名",
            ),
            const SizedBox(height: 16),
            Text(
              "3枚" * 1,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
