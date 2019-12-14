import 'package:flutter/material.dart';

class BPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登入'),
      ),
      body: Text(
        'You have pushed the button this many times:',
      ),
    );
  }
}

RaisedButton createLoginBtn() {
  var result = RaisedButton(
    child: Text("登入"),
    onPressed: () {},
  );

  return result;
}

Widget createLoginText() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    alignment: Alignment.center,
    height: 60.0,
    decoration: new BoxDecoration(
        color: Colors.white70,
        border: new Border.all(color: Colors.blueGrey, width: 4.0),
        borderRadius: new BorderRadius.circular(12.0)),
    child: new TextFormField(
      decoration: InputDecoration.collapsed(hintText: 'username'),
    ),
  );
}
Widget createPasswordText() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    alignment: Alignment.center,
    height: 60.0,
    decoration: new BoxDecoration(
        color: Colors.white70,
        border: new Border.all(color: Colors.blueGrey, width: 4.0),
        borderRadius: new BorderRadius.circular(12.0)),
    child: new TextFormField(
      decoration: InputDecoration.collapsed(hintText: 'password'),
    ),
  );
}
