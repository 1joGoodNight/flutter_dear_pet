import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/app_bar.dart';
import 'package:flutter_dear_pet/detail_page_bottom_btn.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset("assets/images/img01.jpg", fit: BoxFit.cover),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 80,
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD))),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '상품이름',
                  style: TextStyle(fontSize: 18, color: Color(0xFF333333)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '16,000',
                      style: TextStyle(fontSize: 24, color: Color(0xFF333333)),
                    ),
                    Text('원',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF333333))),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '상품 설명',
                  style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '이 상품은 아주 좋은 상품입니다. 상품 설명은 여러줄이 들어 갈 수 있습니다. 여러분의 쇼핑몰에 맞게 다양한 요소를 추가해보세요. 예를 들어 카테고리나 등등...이 상품은 아주 좋은 상품입니다. 상품 설명은 여러줄이 들어 갈 수 있습니다. 여러분의 쇼핑몰에 맞게 다양한 요소를 추가해보세요. 예를 들어 카테고리나 등등...이 상품은 아주 좋은 상품입니다. 상품 설명은 여러줄이 들어 갈 수 있습니다. 여러분의 쇼핑몰에 맞게 다양한 요소를 추가해보세요. 예를 들어 카테고리나 등등...이 상품은 아주 좋은 상품입니다. 상품 설명은 여러줄이 들어 갈 수 있습니다. 여러분의 쇼핑몰에 맞게 다양한 요소를 추가해보세요. 예를 들어 카테고리나 등등...',
                  style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const BuyWidget(),
    );
  }
}
