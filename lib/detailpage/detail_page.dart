import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/app_bar.dart';
import 'package:flutter_dear_pet/detailpage/widget/buy_btn.dart';
import 'package:flutter_dear_pet/models/products.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Products product;
  DetailPage({super.key, required this.product});

  //가격표 재구성 숫자 포맷
  final formatCurrency = NumberFormat('#,###');

  //사진영역 UI
  AspectRatio detail_photo() {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(product.imgpath, fit: BoxFit.cover),
    );
  }

  //제목가격 영역 UI
  Container detail_title(String thisPrice) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.name,
            style: const TextStyle(fontSize: 18, color: Color(0xFF333333)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                thisPrice,
                style: const TextStyle(fontSize: 24, color: Color(0xFF333333)),
              ),
              const Text('원',
                  style: TextStyle(fontSize: 16, color: Color(0xFF333333))),
            ],
          ),
        ],
      ),
    );
  }

  //상세설명 영역 UI
  Container detail_description() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '상품 설명',
            style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.discriptions,
            style: const TextStyle(fontSize: 16, color: Color(0xFF333333)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //가격표 재구성(세자리마다 콤마)
    String thisPrice = formatCurrency.format(product.price).toString();

    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        children: [
          detail_photo(),
          detail_title(thisPrice),
          detail_description(),
        ],
      ),
      bottomNavigationBar: BuyBtn(price: product.price, name: product.name),
    );
  }
}
