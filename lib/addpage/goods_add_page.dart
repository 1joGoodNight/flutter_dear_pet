import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/addpage/widget/goods_bottom.dart';
import 'package:flutter_dear_pet/addpage/widget/goods_image.dart';

class GoodsAddPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DearPet'),
      ),
      body: Column(
        children: [
          GoodsImage(),
          GoodsBottom(),
        ],
      )
    );
  
  }
}