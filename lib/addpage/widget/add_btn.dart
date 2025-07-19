import 'package:flutter/material.dart';

SafeArea addBtn() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          //버튼 클릭 이벤트
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
