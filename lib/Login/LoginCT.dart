import 'package:flutter/material.dart';
import 'LoginWidget.dart';

void main() => runApp(LoginCT());

class LoginCT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: createLoginText(),
      ),
       Padding(
        padding: const EdgeInsets.all(30.0),
        child: createPasswordText(),
      ),
      RaisedButton(
        child: Text('登入'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginCT()));
        },
      ),
    ]));
  }
}
