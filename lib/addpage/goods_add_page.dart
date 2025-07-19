import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/addpage/widget/add_btn.dart';
import 'package:flutter_dear_pet/addpage/widget/goods_bottom.dart';
import 'package:flutter_dear_pet/addpage/widget/goods_image.dart';
import 'package:flutter_dear_pet/app_bar.dart';

class GoodsAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          GoodsImage(),
          GoodsBottom(),
        ],
      ),
      bottomNavigationBar: addBtn(context),
    );
  }
}
