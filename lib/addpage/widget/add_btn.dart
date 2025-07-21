import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/models/products.dart';

SafeArea addBtn(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController priceController,
    TextEditingController descController,
    File? image) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          // 예외처리
          if (image == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("사진을 선택해주세요.")),
            );
            return;
          }
          if (nameController.text.trim().isEmpty ||
              priceController.text.trim().isEmpty ||
              descController.text.trim().isEmpty) {
            // 입력값이 없으면 SnackBar 등으로 사용자에게 알림
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("내용을 입력해주세요.")),
            );
            return;
          }

          //버튼 클릭 이벤트
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text("등록 완료 되었습니다."),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text('확인'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(
                            context,
                            Products(
                              name: nameController.text,
                              price: int.parse(priceController.text),
                              discriptions: descController.text,
                              imgpath: image.path,
                            ));
                      },
                    )
                  ],
                );
              });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFAA61F4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '등록하기',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color(0xFF924BD9),
                  borderRadius: BorderRadius.circular(5)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
