import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/BaseStyle.dart';
//import 'package:ctestapp/Login/LoginWidget.dart';
import 'package:flutter/material.dart';

import '../Login/LoginWidget.dart';
import 'Page1Style.dart';

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
  final  levelTxt = ["A1","A2","B1","B2","C1","C2"];
  @override
  Widget build(BuildContext context) {
    mcontext = context;
    return Center(
      child: Container(
        width: MaxSize.width,
        height: MaxSize.height * 0.8,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // GetIndexExample(),
                  // VoiceSlider(),
                  //Text("exampletitle"),
                  //HeaderWidget("example"),
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: MaxSize.width / 40,
                crossAxisSpacing: MaxSize.width / 40,
                childAspectRatio: 1,
              ),
              delegate: SliverChildListDelegate(
                [
                  for (var i = 0; i < 6; i++) createBtn(i),
                ],
              ),
            ),
            //GetPicABC(),
          ],
        ),
      ),
    );
  }

  createBtn(i) {
    return RaisedButton(
      color: Colors.green[200],
      splashColor: Colors.white,
      elevation: 20,
      child: Text(
        levelTxt[i],
        style: btntextnormal(),
      ),
      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
      onPressed: () async {
        // await checkBtnclick();
      },
    );
  }
}
