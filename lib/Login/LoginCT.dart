import 'package:ctestapp/Base/BaseConstant.dart';
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
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mcontext = context;
    initData();
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 10),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createUsernameField(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createPasswordField(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
            child: createLoginBtn(),
          ),
        ]),
      ),
    );
  }
}
