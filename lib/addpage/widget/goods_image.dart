import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GoodsImage extends StatefulWidget {
  @override
  State<GoodsImage> createState() => _GoodsImageState();
}

class _GoodsImageState extends State<GoodsImage> {
  File? _selectedImage; // 선택된 이미지 저장할 변수

  Future<void> getImagePickerData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      print('선택한 이미지 경로: ${image.path}');
    } else {
      print('이미지를 선택하지 않았습니다.'); // 선택 안했을 시 해당 문구 출력
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      height: 412,
      color: Color(0xFFD9D9D9),
      child: GestureDetector(
        // 이미지 선택과 이미지 아이콘 누르면 갤러리로 이동
        onTap: () {
          getImagePickerData(); // 갤러리로 넘어가는 함수
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    height: 412,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/images/img_noimg.png'), // NO IMG 이미지
            _selectedImage == null
                ? SizedBox(
                    height: 16,
                  )
                : SizedBox(),
            _selectedImage == null ? imageInputButton() : SizedBox(),
          ],
        ),
      ),
    ));
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
          Text(
            '이미지 선택',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF888888),
            ),
          ),
          SizedBox(width: 18),
          Image.asset(
            'assets/images/icon_plus.png', // + 이미지
            color: Color(0xFF888888),
            width: 16,
            height: 16,
          )
        ],
      ),
    ),
  );
}
