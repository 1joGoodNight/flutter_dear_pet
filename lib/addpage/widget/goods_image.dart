import 'package:flutter/material.dart';

class GoodsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      color: Color(0xFFD9D9D9),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/img_noimg.png'),
            SizedBox(
              height: 16,
            ),
            Container(
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
                      'assets/images/icon_plus.png',
                      color: Color(0xFF888888), width: 16,height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
