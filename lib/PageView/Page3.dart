import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/BaseStyle.dart';
import 'package:ctestapp/Grade/GradeView.dart';
import 'package:flutter/material.dart';


void main() => runApp(ClsPage3());

class ClsPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Text('CTest'),
        ),
        body: Page3(),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  static var mcontext;
  @override
  Widget build(BuildContext context) {
    mcontext = context;
    return Container(
      width: MaxSize.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 20),
        child: Column(children: <Widget>[
          createBtn(),
        ]),
      ),
    );
  }

  createBtn() {
    return SizedBox(
      width: MaxSize.width,
      height: MaxSize.height/10,
      child: RaisedButton(
        color: Colors.green[200],
        splashColor: Colors.white,
        elevation: 20,
        child: Text(
          "2019/12/30   A1",
          style: btntextnormal(),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        onPressed: () async {
          await goGrade();
        },
      ),
    );
  }

  goGrade() async {
    Navigator.push(
        mcontext,
        MaterialPageRoute(
            builder: (mcontext) => GradeView(), maintainState: false));
  }
}
