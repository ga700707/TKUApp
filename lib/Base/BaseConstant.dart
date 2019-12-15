import 'package:flutter/material.dart';

class Constant {
  static const String Chat_Api_URL = "http://163.13.243.125:49705/";
}

class MaxSize {
  static double width;
  static double height;
  // 構造函數，需和類同名
  initWH(context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}

class Cookie {
  static String token;
  settoken(mtoken) {
    token = mtoken;
  }
}
