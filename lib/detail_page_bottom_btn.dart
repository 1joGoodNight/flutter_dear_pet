import 'package:flutter/material.dart';

class BuyWidget extends StatefulWidget {
  const BuyWidget({
    super.key,
  });

  @override
  State<BuyWidget> createState() => _BuyWidgetState();
}

class _BuyWidgetState extends State<BuyWidget> {
  //수량 변경 버튼
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

  //수량 변경 - 마이너스 이벤트
  void quantityMinus() {
    //버튼 이벤트 작성!
  }

  //수량 변경 + 플러스 이벤트
  void quantityPlus() {
    //버튼 이벤트 작성!
  }

  //BUY버튼 UI
  GestureDetector buyBtn() {
    return GestureDetector(
      onTap: () {
        //버튼 이벤트 작성!
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
                        () => quantityMinus()),
                    const SizedBox(
                      width: 42,
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                    quantityBtn(
                        Image.asset(
                          "assets/images/icon_plus.png",
                        ),
                        () => quantityPlus()),
                  ],
                ),
              ),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(255, 255, 255, 0.8)),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('17,000',
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        Text(
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
