import 'dart:convert';

import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/Request.dart';
import 'package:ctestapp/PageView/PageViewCT.dart';

import 'package:flutter/material.dart';
import 'LoginStyle.dart';

final TextEditingController usernameCT = new TextEditingController();
final TextEditingController passwordCT = new TextEditingController();
Widget createLoginBtn(context) {
  var result = SizedBox(
    height: MaxSize.height / 10,
    width: MaxSize.width,
    child: RaisedButton(
      child: Text(
        "登入",
        style: btnStyle(),
      ),
      onPressed: () async {
        login(context);
      },
    ),
  );

  return result;
}

Future<void> login(context) async {
  Map<String, String> jsonString = {
    "username": usernameCT.text,
    "password": passwordCT.text,
    "Type": "",
  };
  print(jsonString);
  var result = await HttpService.postTest(
      Constant.Chat_Api_URL + "member/login", jsonString);
  if (result == null) return;
  var jsonStr = json.decode(result);
  print(jsonStr);
  print(jsonStr['id']);
  Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewCT()));
}

Widget createUsernameField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 50),
    alignment: Alignment.center,
    height: MaxSize.height / 10,
    decoration: new BoxDecoration(
        color: Colors.white70,
        border: new Border.all(color: Colors.blueGrey, width: 4.0),
        borderRadius: new BorderRadius.circular(12.0)),
    child: new TextFormField(
      controller: usernameCT,
      decoration: InputDecoration.collapsed(
        hintText: '帳號',
        hintStyle: usernameHintStyle(),
      ),
      style: usernameStyle(),
    ),
  );
}

Widget createPasswordField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 50),
    alignment: Alignment.center,
    height: MaxSize.height / 10,
    decoration: new BoxDecoration(
        color: Colors.white70,
        border: new Border.all(color: Colors.blueGrey, width: 4.0),
        borderRadius: new BorderRadius.circular(12.0)),
    child: new TextFormField(
      controller: passwordCT,
      decoration: InputDecoration.collapsed(
        hintText: '密碼',
        hintStyle: passwordHintStyle(),
      ),
      style: passwordStyle(),
    ),
  );
}
