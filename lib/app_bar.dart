import 'package:flutter/material.dart';
import 'package:flutter_dear_pet/cartpage/cart_page.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: !Navigator.canPop(context)
        ? null
        : GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                color: Colors.transparent,
                child: Image.asset("assets/images/icon_left.png",)),
          ),
    leadingWidth: 38,
    backgroundColor: Colors.white,
    title: SizedBox(
        width: 127,
        child: Image.asset(
          "assets/images/logo.png",
        )),
    centerTitle: false,
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CartPage()));
        },
        child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            color: Colors.transparent,
            child: Image.asset("assets/images/icon_shopping_bag.png")),
      )
    ],
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: const Color(0xFFDDDDDD),
        )),
  );
}
