import 'package:flutter/material.dart';

class GoodsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            width: 412,
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '상품등록',
                style: TextStyle(color: Color(0xFF888888), fontSize: 12),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFFF7F4FF),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFDDDDDD),
                ),
              ),
            ),
          ),
          Container(
            width: 412,
            height: 69,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '상품 이름',
                style: TextStyle(color: Color(0xFF333333), fontSize: 16),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFDDDDDD),
                ),
              ),
            ),
          ),
          Container(
            width: 412,
            height: 69,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '상품 가격',
                style: TextStyle(color: Color(0xFF333333), fontSize: 16),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFDDDDDD),
                ),
              ),
            ),
          ),
          Container(
            width: 412,
            height: 69,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '상품 설명',
                style: TextStyle(color: Color(0xFF333333), fontSize: 16),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
