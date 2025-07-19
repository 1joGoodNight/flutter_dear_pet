import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> goodsList = ['강아지', 20000, '강아지입니다.'];
  Set<int> clickedIndices = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('appBar')),
      body: SafeArea(
          child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 6,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          //  List.generate(20, (index) {
          bool isClicked = clickedIndices.contains(index);
          return InkWell(
            onTap: () {
              setState(() {
                if (isClicked) {
                  clickedIndices.remove(index);
                } else {
                  clickedIndices.add(index);
                }
              });
            },
            child: Container(
              color: isClicked ? Color(0xFFE3D7FF) : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.asset(
                          'assets/images/img01.jpg',
                          // width: 174,
                          // height: 174,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '상품이름',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text('16,000원',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
