import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/app_bar.dart';
import 'package:flutter_dear_pet/cartpage/widget/buy_btn.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  //아이템 박스
  Container cartItem() {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/img01.jpg')),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '상품이름',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      Icons.close,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8, 0, 10, 0),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F4FF),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.remove,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(child: Text('1')),
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.add,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '16,000',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '원',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [cartItem()],
      ),
      bottomNavigationBar: buyBtn(context),
    );
  }
}
