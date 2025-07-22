import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: !ModalRoute.of(context)!.canPop
        ? null
        : GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(13),
                color: Colors.transparent,
                child: Image.asset("assets/images/icon_left.png")),
          ),
    backgroundColor: Colors.white,
    title: Image.asset("assets/images/logo.png"),
    centerTitle: false,
    actions: [
      GestureDetector(
        onTap: () {},
        child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(13),
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
