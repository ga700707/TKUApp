import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Login/LoginWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(ClsPage2());

class ClsPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Text('CTest'),
        ),
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 10),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(context),
          ),
        ]),
      ),
    );
  }
}
