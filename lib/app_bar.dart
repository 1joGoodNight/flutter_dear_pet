import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    title: Image.asset("assets/images/logo.png"),
    centerTitle: false,
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: const Color(0xFFDDDDDD),
        )),
  );
}
