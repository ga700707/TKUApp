import 'dart:convert';

import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/Request.dart';
import 'package:ctestapp/PageView/Page1Style.dart';
import 'package:ctestapp/PageView/PageViewCT.dart';

import 'package:flutter/material.dart';

Widget createLoginBtn(context) {
  var result = SizedBox(
    height: 3*MaxSize.height / 4,
    width: 3*MaxSize.width / 4,
    child: RaisedButton(
      color: Colors.red[400],
      splashColor: Colors.white,
      elevation: 20,
      child: Text(
        "進入考場",
        style: btnStyle(),
      ),
      shape: CircleBorder(
        side: BorderSide(
          color: Colors.white,
          width: MaxSize.width/70),
        
      ),
      
      onPressed: () async {
        //login(context);
      },
    ),
  );

  return result;
}

Future<void> login(context) async {
  Map<String, String> jsonString = {
    "Type": "",
  };
  print(jsonString);
  var result = await HttpService.postTest(
      Constant.Chat_Api_URL + "member/login", jsonString);
  if (result == null) return;
  var jsonStr = json.decode(result);
  print(jsonStr);
  print(jsonStr['id']);
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => PageViewCT()));
}
