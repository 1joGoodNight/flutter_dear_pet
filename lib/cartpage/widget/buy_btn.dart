import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SafeArea buyBtn(BuildContext context, VoidCallback onBuyComplete) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: ElevatedButton(
        onPressed: () {
          //버튼 클릭 이벤트
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text("구매 완료 되었습니다."),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('확인'),
                    onPressed: () {
                      onBuyComplete();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color(0xFFAA61F4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '구매하기',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color(0xFF924BD9),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'BUY',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
