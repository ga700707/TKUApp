import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/PageView/Page1Widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(ClsPage1());

class ClsPage1 extends StatelessWidget {
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
      child: Center(
        
        child: createLoginBtn(context)), 
    );
  }
}
