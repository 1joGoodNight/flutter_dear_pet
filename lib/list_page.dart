import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dear_pet/app_bar.dart';
import 'package:flutter_dear_pet/detailpage/detail_page.dart';
import 'package:flutter_dear_pet/models/products.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Products> goodsList = []; //Products 리스트 생성
  Set<int> clickedIndices = {}; //클릭시 색 변경되는 리스트

  Future<void> loadProducts() async {
    //비동기함수
    final String jsonString = await rootBundle.loadString('lib/data/data.json');
    //print(jsonString.runtimeType); //data.json에서 파일 읽고 문자열로 jsonString저장
    final List<dynamic> jsonData = json
        .decode(jsonString); //jsonString를 List<dynamic>형태로 변환하여 jsonData에 저장
    //print(jsonData.runtimeType);
    final List<Products> loadedProducts =
        jsonData.map((item) => Products.fromJson(item)).toList();

    setState(() {
      goodsList = loadedProducts;
      // print(goodsList.isEmpty);
    });
  }

  @override
  void initState() {
    //화면이 생성될떄 loadProducts실행
    super.initState();
    loadProducts();
  }

  void _handleTap(index) async {
    setState(() => clickedIndices.add(index));
    await Future.delayed(const Duration(milliseconds: 200)); // 잠깐 색 바뀌게
    setState(() => clickedIndices.remove(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: goodsList.isEmpty
          ? Center(
              //crossAxisAlignment: CrossAxisAlignment.center,
              child: Text('상품이 없습니다.'),
            )
          : SafeArea(
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5 / 6.5,
              ),
              itemCount: goodsList.length,
              itemBuilder: (context, index) {
                final product = goodsList[index];
                //  List.generate(20, (index) {
                bool isClicked = clickedIndices.contains(index);
                return Container(
                  decoration: BoxDecoration(
                    color: isClicked ? Color(0xFFE3D7FF) : Colors.white,
                    border: Border(
                        right: BorderSide(
                            color: index % 2 == 0
                                ? Color(0xffdddddd)
                                : Colors.white),
                        bottom: BorderSide(color: Color(0xffdddddd))),
                  ),
                  child: InkWell(
                    onTap: () {
                      _handleTap(index);

                      //print(product.name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(product: product)));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: Image.asset(
                                product.imgpath,
                                // width: 174,
                                // height: 174,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                //상품이름
                                product.name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      //'${NumberFormat('#,###').format(total)}'
                                      text: product.price == 0
                                          ? '무료'
                                          : NumberFormat('#,###')
                                              .format(product.price),
                                      style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black, // 기본 색상
                                      ),
                                    ),
                                    TextSpan(
                                      text: '원',
                                      style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 12, // '원' 글자만 작게
                                        fontWeight: FontWeight.w400,
                                        color:
                                            product.price != 0 //아이디어 기여자:정귀요미소린
                                                ? Colors.black
                                                : Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
    );
  }
}
