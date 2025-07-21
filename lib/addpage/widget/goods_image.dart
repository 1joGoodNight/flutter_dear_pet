import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GoodsImage extends StatelessWidget {
  final File? selectedImage; // 선택된 이미지 저장할 변수
  final void Function(File selectedFile) onImageChanged;

  GoodsImage(this.selectedImage, this.onImageChanged);

  Future<void> getImagePickerData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onImageChanged(File(image.path));
      print('선택한 이미지 경로: ${image.path}');
    } else {
      print('이미지를 선택하지 않았습니다.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.4,
        color: const Color(0xFFD9D9D9),
        child: GestureDetector(
          onTap: getImagePickerData,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              selectedImage != null
                  ? Expanded(
                      child: Image.file(
                        selectedImage!,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Column(
                      children: [
                        Image.asset('assets/images/img_noimg.png'),
                        const SizedBox(height: 16),
                        imageInputButton(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget imageInputButton() {
  return Container(
    height: 40,
    width: 144,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Text(
            '이미지 선택',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF888888),
            ),
          ),
          const SizedBox(width: 18),
          Image.asset(
            'assets/images/icon_plus.png',
            color: const Color(0xFF888888),
            width: 16,
            height: 16,
          ),
        ],
      ),
    ),
  );
}
