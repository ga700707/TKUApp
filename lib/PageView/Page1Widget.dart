import 'dart:convert';

import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/Request.dart';
import 'package:ctestapp/PageView/Page1Style.dart';
import 'package:ctestapp/PageView/PageViewCT.dart';

import 'package:flutter/material.dart';
final TextEditingController TokenCT = new TextEditingController();

Widget createLoginBtn(context) {
  var result = SizedBox(
    height: 3 * MaxSize.height / 4,
    width: 3 * MaxSize.width / 4,
    child: RaisedButton(
      color: Colors.red[400],
      splashColor: Colors.white,
      elevation: 20,
      child: Text(
        "進入考場",
        style: btnStyle(),
      ),
      shape: CircleBorder(
        side: BorderSide(color: Colors.white, width: MaxSize.width / 70),
      ),
      onPressed: () async {
        login(context);
      },
    ),
  );

  return result;
}

login(context) {
  showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text("進入考場"),
          content: Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: tokenFiled(),
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("取消"),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("確認"),
            ),
          ],
        );
      });
}

Widget tokenFiled() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 50),
    alignment: Alignment.center,
    height: MaxSize.height / 10,
    decoration: new BoxDecoration(
        color: Colors.white70,
        border: new Border.all(color: Colors.blueGrey, width: 4.0),
        borderRadius: new BorderRadius.circular(12.0)),
    child: new TextFormField(
      controller: TokenCT,
      decoration: InputDecoration.collapsed(
        hintText: '認證碼',
        hintStyle: tokenHintStyle(),
      ),
      style: tokenStyle(),
    ),
  );
}
