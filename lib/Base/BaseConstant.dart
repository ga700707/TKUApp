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

class ExampleContent {
  static var voiceExample = <String>[];

  static List<String> txtExample;
  static List<String> txtA;
  static List<String> txtB;
  static List<String> txtC;
  static List<String> txtD;
  static List<String> txtE;
  static List<String> txtF;

  static List<Uint8List> picA;
  static List<Uint8List> picB;
  static List<Uint8List> picC;
  static List<Uint8List> picExample;
  static Uint8List picExampleGroup;

  static int category;
  static int level;
  static int contentLength;
  // 構造函數，需和類同名
  init(jsonStr) {
    print("==========jsonStr==========");
    print(jsonStr);
    print("length" + jsonStr["examplecontent"].length.toString());
    var content = jsonStr["examplecontent"];
    contentLength = content.length;
    level = jsonStr["level"];
    category = jsonStr["category"];
    if (jsonStr["picExampleGroup"] != null)
      picExampleGroup = base64Decode(content["picExampleGroup"]);

    for (var i = 0; i < contentLength; i++) {
      voiceExample[i] = content[i]["voiceExample"];
      print(voiceExample);
      voiceExample.add("1234");
      txtExample[i] = content[i]["txtExample"];
      txtA[i] = content[i]["txtA"];
      txtB[i] = content[i]["txtB"];
      txtC[i] = content[i]["txtC"];
      txtD[i] = content[i]["txtD"];
      txtE[i] = content[i]["txtE"];
      txtF[i] = content[i]["txtF"];

      if (content[i]["picExample"] != null)
        picExample[i] = base64Decode(content[i]["picExample"]);
      else if (content[i]["picA"] != null)
        picA[i] = base64Decode(content[i]["picA"]);
      else
        picA[i] = null;
      if (content[i]["picB"] != null)
        picB[i] = base64Decode(content[i]["picB"]);
      else
        picB[i] = null;
      if (content[i]["picC"] != null)
        picC[i] = base64Decode(content[i]["picC"]);
      else
        picC[i] = null;
    }
  }
}
