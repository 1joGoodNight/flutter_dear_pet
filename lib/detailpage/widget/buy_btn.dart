import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuyBtn extends StatefulWidget {
  final int price;
  final String name;
  const BuyBtn({
    super.key,
    required this.price,
    required this.name,
  });

  @override
  State<BuyBtn> createState() => _BuyBtnState();
}

class _BuyBtnState extends State<BuyBtn> {
  int quantity = 1; //수량
  int total = 0; //총가격

  //초기총액계산
  @override
  void initState() {
    super.initState();
    total = widget.price * quantity;
  }

  //수량 변경 버튼 UI
  GestureDetector quantityBtn(Image image, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
            color: const Color(0xFF9D57E4),
            borderRadius: BorderRadius.circular(5)),
        child: image,
      ),
    );
  }

  //수량 변경 함수
  void quantityUpDown(String updown) {
    if (updown == 'minus') {
      if (quantity > 1) {
        quantity--;
      }
    } else if (updown == 'plus') {
      if (quantity < 99) {
        quantity++;
      }
    }
    total = (widget.price) * quantity;
    setState(() {});
  }

  //BUY버튼 UI
  GestureDetector buyBtn() {
    return GestureDetector(
      onTap: () {
        //버튼 이벤트 작성!
        showCupertinoDialogBox(context, widget.name, quantity);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: const Color(0xFF924BD9),
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: const Text(
          'BUY',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  //쿠퍼티노 다이얼로그
  void showCupertinoDialogBox(BuildContext context, String name, int quantity) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('$name을 $quantity개\n구매하시겠습니까?'),
        actions: [
          CupertinoDialogAction(
            child: const Text('취소'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('확인'),
            onPressed: () {
              // 두 번째 다이얼로그 띄우기
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text('확인되었습니다'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('닫기'),
                      onPressed: () {
                        //모든 팝업 닫기
                        int count = 0;
                        Navigator.popUntil(context, (_) => count++ == 2);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFAA61F4),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    quantityBtn(
                        Image.asset(
                          "assets/images/icon_minus.png",
                        ),
                        () => quantityUpDown('minus')),
                    SizedBox(
                      width: 42,
                      child: Center(
                          child: Text(
                        '$quantity',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                    quantityBtn(
                        Image.asset(
                          "assets/images/icon_plus.png",
                        ),
                        () => quantityUpDown('plus')),
                  ],
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(255, 255, 255, 0.8)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${NumberFormat('#,###').format(total)}',
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white)),
                        const Text(
                          '원',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 0.8)),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              buyBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
