import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/addpage/goods_add_page.dart';
import 'package:flutter_dear_pet/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'NotoSans', scaffoldBackgroundColor: Colors.white),
      home: GoodsAddPage(),
    );
  }
}
