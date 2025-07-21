import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dear_pet/addpage/widget/add_btn.dart';

class GoodsBottom extends StatefulWidget {
  final File? selectedImage;

  GoodsBottom(this.selectedImage);

  @override
  State<GoodsBottom> createState() => _GoodsBottomState();
}

class _GoodsBottomState extends State<GoodsBottom> {
  final TextEditingController _nameController = TextEditingController(); // 상품 이름용
  final TextEditingController _priceController = TextEditingController(); // 상품 가격용
  final TextEditingController _descController = TextEditingController(); // 상품 설명용

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: 412,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F4FF),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFDDDDDD)),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '상품등록',
                        style: TextStyle(color: Color(0xFF888888), fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 412,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFDDDDDD)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          '상품 이름',
                          style: TextStyle(color: Color(0xFF333333), fontSize: 16),
                        ),
                        SizedBox(width: 41),
                        Expanded(
                          child: SizedBox(
                            width: 268,
                            height: 48,
                            child: TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: '상품 이름을 입력하세요.',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFAAAAAA)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 412,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFDDDDDD)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          '상품 가격',
                          style: TextStyle(color: Color(0xFF333333), fontSize: 16),
                        ),
                        SizedBox(width: 41),
                        Expanded(
                          child: SizedBox(
                            width: 268,
                            height: 48,
                            child: TextField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                suffixText: ' 원',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFFAAAAAA)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 412,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            '상품 설명',
                            style: TextStyle(color: Color(0xFF333333), fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _descController,
                            maxLines: null,
                            expands: true,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 20, left: 12),
                              hintText: '상품 설명을 입력하세요.',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFFAAAAAA)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          addBtn(
            context,
            _nameController,
            _priceController,
            _descController,
            widget.selectedImage,
          ),
        ],
      ),
    );
  }
}
