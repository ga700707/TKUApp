import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/Request.dart';
import 'package:ctestapp/PageView/Page1Style.dart';
import 'package:flutter/material.dart';

import '../Base/AudioProvider.dart';

final TextEditingController authenticationCT = new TextEditingController();
BuildContext mcontext;
Widget checkBtn() {
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
        checkBtnclick();
      },
    ),
  );

  return result;
}

checkBtnclick() {
  showDialog(
      context: mcontext,
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
  test(jsonStr["id"]);
  //Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewCT()));
}

AudioPlayer audioPlayer ;
AudioProvider audioProvider;
Future<void> test(id) async {
  Map<String, String> jsonString = {
    "ExamRoomId": id.toString(),
    "ExamIndex": "0",
  };
  print(jsonString);
  var result = await HttpService.postTestToken(
      Constant.Chat_Api_URL + "room/GetExam", jsonString);
  if (result == null) return;
  var jsonStr = json.decode(result);
  var content = jsonStr["examplecontent"][0];
  audioPlayer = new AudioPlayer();
  audioProvider = new AudioProvider(content["voiceExample"]);
  String localUrl = await audioProvider.load();
  print("localUrl");
  print(localUrl);
  play();
  //Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewCT()));
}

play() async {
  String localUrl = await audioProvider.load();
  audioPlayer.play(localUrl, isLocal: true);
  var time = await audioPlayer.getDuration();
  audioPlayer.setVolume(1);
  print(time);
}
