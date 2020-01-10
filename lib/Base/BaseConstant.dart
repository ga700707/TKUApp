import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Constant {
  static const String Chat_Api_URL = "http://163.13.243.125:49705/";
  static int examRoomId;
  static int examIndex;
  static int examLength;
  static bool turnScreen;
  static bool isPlay;
}
class Grade {
 
  static int voiceCorrect;
  static int readCorrect;
  static int voiceTotal;
  static int readTotal;
  static int voiceScore;
  static int readScore;
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
  static int id;
  settoken(mtoken) {
    token = mtoken;
  }

  setId(mId) {
    id = mId;
  }
}

class Answer {
  static int id;
  static int answer;
  static var answerArray = Map<int, int>();
  init() {
    answerArray.clear();
  }

  add(id, answer) {
    answerArray[id] = answer;
    print(answerArray);
  }

  getById(id) {
    return answerArray[id];
  }

  getAll() {
    return answerArray;
  }
  // var myMap1 = Map<String, int>();

  // Answer.fromJson(Map<int, dynamic> json)
  //     : id = json['id'],
  //       answer = json['answer'];

  // Map<int, dynamic> toJson() => {
  //       3: 3,
  //       3: "111",
  //     };
}

class ExampleContent {
  static String voiceExample;
  static List<int> id;

  static List<String> txtExample;
  static List<String> txtA;
  static List<String> txtB;
  static List<String> txtC;
  static List<String> txtD;
  static List<String> txtE;
  static List<String> txtF;

  static Uint8List picA;
  static Uint8List picB;
  static Uint8List picC;
  static Uint8List picExample;
  static Uint8List picExampleGroup;
  static String txtExampleGroup;

  static int category;
  static int level;
  static int contentLength;
  // 構造函數，需和類同名
  init(jsonStr) {
    print("==========jsonStr==========");
    print(jsonStr);
    var content = jsonStr["examplecontent"][0];
    contentLength = jsonStr["examplecontent"].length;

    level = jsonStr["level"];
    category = jsonStr["category"];
    txtExampleGroup = jsonStr["txtExampleGroup"];
    picExampleGroup = (jsonStr["picExampleGroup"] != null)
        ? base64Decode(jsonStr["picExampleGroup"])
        : null;

    voiceExample = content["voiceExample"];
    picExample = (content["picExample"] != null)
        ? base64Decode(content["picExample"])
        : null;
    id = new List<int>();
    txtExample = new List<String>();
    txtA = new List<String>();
    txtB = new List<String>();
    txtC = new List<String>();
    txtD = new List<String>();
    txtE = new List<String>();
    txtF = new List<String>();

    for (var contentTxt in jsonStr["examplecontent"]) {
      id.add(contentTxt["id"]);
      txtExample.add(contentTxt["txtExample"]);
      txtA.add(contentTxt["txtA"]);
      txtB.add(contentTxt["txtB"]);
      txtC.add(contentTxt["txtC"]);
      txtD.add(contentTxt["txtD"]);
      txtE.add(contentTxt["txtE"]);
      txtF.add(contentTxt["txtF"]);
    }

    picA = (content["picA"] != null) ? base64Decode(content["picA"]) : null;
    picB = (content["picB"] != null) ? base64Decode(content["picB"]) : null;
    picC = (content["picC"] != null) ? base64Decode(content["picC"]) : null;
  }
}
