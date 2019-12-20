import 'dart:convert';

import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import '../Base/Request.dart';
import '../ExamRoom/ExamRoomCT.dart';
import '../Login/LoginWidget.dart';
import 'Page1Style.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstPageState();
}

class FirstPageState extends State<Page1> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    mcontext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("CTest"),
      ),
      body: Center(
        child: checkBtn(),
      ),
    );
  }

  final TextEditingController authenticationCT = new TextEditingController();

  Widget checkBtn() {
    authenticationCT.text = "333390";
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
          await checkBtnclick();
        },
      ),
    );

    return result;
  }

  checkBtnclick() {
    showDialog(
        context: mcontext,
        builder: (mcontext) {
          return new AlertDialog(
            title: new Text("進入考場"),
            content: Padding(
              padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
              child: tokenFiled(),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(mcontext).pop();
                },
                child: new Text("取消"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(mcontext).pop();
                  checkAuthentication();
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
        controller: authenticationCT,
        decoration: InputDecoration.collapsed(
          hintText: '認證碼',
          hintStyle: tokenHintStyle(),
        ),
        style: tokenStyle(),
      ),
    );
  }

  Future<void> checkAuthentication() async {
    Map<String, String> jsonString = {
      "authentication": authenticationCT.text,
    };
    print(jsonString);
    var result = await HttpService.postTestToken(
        Constant.Chat_Api_URL + "room/CheckAuthentication", jsonString);
    if (result == null) return;
    var jsonStr = json.decode(result);
    print(jsonStr["id"]);
    Constant.examRoomId = jsonStr["id"];
    Constant.examIndex = 0;
    getExample();
  }

  getExample() async {
    Map<String, String> jsonString = {
      "ExamRoomId": Constant.examRoomId.toString(),
      "ExamIndex": Constant.examIndex.toString(),
    };
    var result = await HttpService.postTestToken(
        Constant.Chat_Api_URL + "room/GetExam", jsonString);
    if (result == null) return;

    var jsonStr = json.decode(result);
    ExampleContent().init(jsonStr);

    Navigator.push(
        mcontext,
        MaterialPageRoute(
            builder: (mcontext) => ExamRoomCT(), maintainState: false));
  }
}
