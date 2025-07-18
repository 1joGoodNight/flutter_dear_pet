import 'package:flutter/material.dart';

class GoodsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          width: double.infinity,
      color: Colors.grey[300]!,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/img_noimg.png'),
            SizedBox(height: 16,),
            Container(
              height: 40,
              width: 144,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
              color: Colors.white),
            ),
            ],
        ),
      ),
    ));
  }
}
