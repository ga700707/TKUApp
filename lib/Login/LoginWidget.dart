import 'dart:convert';

import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/DatabaseHelper.dart';
import 'package:ctestapp/Base/Request.dart';


import 'package:flutter/material.dart';
import '../PageView/PageViewCT.dart';
import 'LoginStyle.dart';

final TextEditingController usernameCT = new TextEditingController();
final TextEditingController passwordCT = new TextEditingController();
final DatabaseHelper dbHelper = DatabaseHelper.instance;

BuildContext mcontext;
Widget createLoginBtn() {
  var result = SizedBox(
    height: MaxSize.height / 10,
    width: MaxSize.width,
    child: RaisedButton(
      child: Text(
        "登入",
        style: btnStyle(),
      ),
      onPressed: () async {
        login();
      },
    ),
  );

  return result;
}

Future<void> login() async {
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
  Cookie().settoken(jsonStr['token']);
  Navigator.push(
      mcontext, MaterialPageRoute(builder: (mcontext) => PageViewCT()));
  _insert();
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

// Button onPressed methods
void initData() async {
  try {
    final allRows = await dbHelper.queryAllRows();
    usernameCT.text = allRows.last["username"];
    passwordCT.text = allRows.last["password"];
  } catch (e) {}
}

void _insert() async {
  final count = await dbHelper.queryRowCount();
  if (count != 0) {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnUsername: usernameCT.text,
      DatabaseHelper.columnPassword: passwordCT.text
    };

    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  } else {
    Map<String, dynamic> row = {
      DatabaseHelper.columnUsername: usernameCT.text,
      DatabaseHelper.columnPassword: passwordCT.text
    };
    final id2 = await dbHelper.insert(row);
    print('inserted row id: $id2');
  }
}

// Future<int> insert(Map<String, dynamic> row) async {
//   Database db = await instance.database;
//   return await db.insert(table, row);
// }
// void _query() async {
//   final allRows = await dbHelper.queryAllRows();
//   print('query all rows:');
//   allRows.forEach((row) => print(row));
// }

// void _update() async {
//   // row to update
//   Map<String, dynamic> row = {
//     DatabaseHelper.columnId   : 1,
//     DatabaseHelper.columnName : 'Mary',
//     DatabaseHelper.columnAge  : 32
//   };
//   final rowsAffected = await dbHelper.update(row);
//   print('updated $rowsAffected row(s)');
// }

// void _delete() async {
//   // Assuming that the number of rows is the id for the last row.
//   final id = await dbHelper.queryRowCount();
//   final rowsDeleted = await dbHelper.delete(id);
//   print('deleted $rowsDeleted row(s): row $id');
// }
