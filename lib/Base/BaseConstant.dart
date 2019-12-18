import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Constant {
  static const String Chat_Api_URL = "http://163.13.243.125:49705/";
  static int examRoomId;
  static int examIndex;
  static bool turnScreen;
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

class Example {
  static double width;
  static double height;
  // 構造函數，需和類同名
  initWH(context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}

class ExampleContent {
  static String voiceExample;
  static String txtExample;
  static Uint8List picA;
  static Uint8List picB;
  static Uint8List picC;
  static Uint8List picExample;

  static int category;
  static int level;

  // 構造函數，需和類同名
  init(content) {
    level = content["level"];
    category = content["category"];
    voiceExample = content["voiceExample"];
    txtExample = content["txtExample"];
    if (content["picExample"] != null)
      picExample = base64Decode(content["picExample"]);
    else if (content["picA"] != null)
      picA = base64Decode(content["picA"]);
    else
      picA = null;
    if (content["picB"] != null)
      picB = base64Decode(content["picB"]);
    else
      picB = null;
    if (content["picC"] != null)
      picC = base64Decode(content["picC"]);
    else
      picC = null;
  }
}
