import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/app_bar.dart';
import 'package:flutter_dear_pet/cartpage/widget/buy_btn.dart';
import 'package:flutter_dear_pet/detailpage/widget/cart_item.dart';
import 'package:flutter_dear_pet/emptyText.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // 장바구니 아이템 UI 위젯
  Widget cartItem(CartItem item) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD))),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: item.imgpath.isNotEmpty
                  ? (item.imgpath.startsWith("assets"))
                      ? Image.asset(
                          item.imgpath,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          File(item.imgpath),
                          fit: BoxFit.cover,
                        )
                  : Container(
                      color: Colors.grey,
                    ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.name, style: const TextStyle(fontSize: 16)),
                    GestureDetector(
                      onTap: () => removeItem(item),
                      child: const Icon(Icons.close, size: 24),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F4FF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 수량 조절 UI
                      Row(
                        children: [
                          quantityBtn(
                            Icons.remove,
                            () => quantityUpDown('minus', item),
                          ),
                          SizedBox(
                            width: 40,
                            child: Center(child: Text('${item.quantity}')),
                          ),
                          quantityBtn(
                            Icons.add,
                            () => quantityUpDown('plus', item),
                          ),
                        ],
                      ),
                      // 가격 표시
                      Row(
                        children: [
                          Text(
                            '${(item.price * item.quantity).toString().replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',')}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Text('원', style: TextStyle(fontSize: 12)),
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

  //수량 UI
  quantityBtn(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  //수량 변경 함수
  void quantityUpDown(String updown, CartItem item) {
    setState(() {
      if (updown == 'minus' && item.quantity > 1) {
        item.quantity--;
      } else if (updown == 'plus' && item.quantity < 99) {
        item.quantity++;
      }
    });
  }

  //삭제함수
  void removeItem(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: cartItems.isEmpty
          ? emptyText('장바구니가 비어있습니다.')
          : ListView(
              children: cartItems.map((item) => cartItem(item)).toList(),
            ),
      bottomNavigationBar: cartItems.isEmpty ? null : buyBtn(context),
    );
  }
}
