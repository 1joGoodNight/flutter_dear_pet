import 'package:flutter/material.dart';

Center emptyText(String text) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Icon(Icons.block, color: Color(0xffdddddd), size: 48,),
      SizedBox(height: 16,),
      Text(text, style: TextStyle(fontSize: 16, color: Color(0xff999999)),),
      SizedBox(height: 60,)
    ],),
  );
}
