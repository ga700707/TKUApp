import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctestapp/Base/BaseStyle.dart';
import 'package:ctestapp/Base/Request.dart';
import 'package:ctestapp/Base/Timer.dart';
import 'package:ctestapp/ExamModal/AC1.dart';
import 'package:ctestapp/ExamModal/AC2.dart';
import 'package:ctestapp/ExamModal/AC3.dart';
import 'package:ctestapp/ExamModal/AC4.dart';
import 'package:ctestapp/ExamModal/AC5.dart';
import 'package:ctestapp/ExamModal/AC6.dart';
import 'package:ctestapp/ExamModal/AC7.dart';
import 'package:ctestapp/ExamModal/AC8.dart';
import 'package:ctestapp/ExamModal/AC9.dart';
import 'package:ctestapp/Grade/GradeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';

import '../Base/AudioProvider.dart';
import '../Base/BaseConstant.dart';
import '../Login/LoginWidget.dart';

void main() {
  // 强制竖屏

  //runApp(new ExamRoomCT());
}

class ExamRoomCT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    mcontext = context;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar:
            PreferredSize(child: AppBar(), preferredSize: Size.fromHeight(0)),
        body: ExamPage(),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: mcontext,
          builder: (context) => new AlertDialog(
            title: new Text('退出App?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('不'),
              ),
              new FlatButton(
                onPressed: () async {
                  await pop();
                },
                child: new Text('是的'),
              ),
            ],
          ),
        ) ??
        false;
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  //ExamRoomBody createState() => ExamRoomBody();
}

class ExamPage extends StatefulWidget {
  @override
  ExamRoomBody createState() => ExamRoomBody();
}

enum PlayerState { stopped, playing, paused }

class ExamRoomBody extends State<ExamPage> {
  AudioPlayer audioPlayer;
  bool _isButtonDisabled = true;
  bool _isFinishDisabled = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    VoicePlay().init(new AudioPlayer());

    OrientationPlugin.forceOrientation(DeviceOrientation.landscapeLeft);
  }

  @override
  void dispose() {
    try {
      VoicePlay.audioPlayer.stop();
    } catch (e) {
      print("error");
    }

    //VoicePlay.audioPlayer.release();
    if (Constant.turnScreen)
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    Constant.turnScreen = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MaxSize().initWH(context);
    print("start");
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 20),
        child: Column(children: <Widget>[
          getHeaderBtn(),
          getModal(),
        ]),
      ),
    );
  }

  getModal() {
    print("modal");
    switch (ExampleContent.category) {
      case 0:
        return AC1();
      case 1:
        return AC2();
      case 2:
        return AC3();
      case 3:
        return AC4();
      case 4:
        return AC5();
      case 5:
        return AC6();
      case 6:
        return AC7();
      case 7:
        return AC8();
      case 8:
        return AC9();
      default:
    }
  }

  getHeaderBtn() {
    return Container(
      padding: EdgeInsets.only(top: MaxSize.height / 30),
      width: MaxSize.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text((Constant.examIndex + 1).toString() + ".", style: btntext()),
            Countdown(),
            //Countdown(),

            Container(
              height: MaxSize.height / 10,
              alignment: Alignment.centerRight,
              child: Row(children: <Widget>[
                RaisedButton(
                  textTheme: ButtonTextTheme.accent,
                  highlightColor: Colors.lightBlue[100],
                  color: _isFinishDisabled
                      ? Colors.lightBlue[400]
                      : Colors.lightBlue[100],
                  shape: new BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: new BorderSide(style: BorderStyle.none)),
                  child: Text(
                    "結束測驗",
                    style: btntext(),
                  ),
                  onPressed: () async {
                    if (_isFinishDisabled) finishExample();
                  },
                ),
                RaisedButton(
                  textTheme: ButtonTextTheme.accent,
                  highlightColor: Colors.lightBlue[100],
                  color: _isButtonDisabled
                      ? Colors.lightBlue[400]
                      : Colors.lightBlue[100],
                  shape: new BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: new BorderSide(style: BorderStyle.none)),
                  child: Text(
                    "下一題",
                    style: btntext(),
                  ),
                  onPressed: () async {
                    if (_isButtonDisabled) getExample();
                  },
                ),
              ]),
            )
          ]),
    );
  }

  getExample() async {
    VoicePlay.audioPlayer.release();

    setState(() {
      Constant.isPlay = false;
      _isButtonDisabled = false;
      print("refresh");
    });
    //VoicePlay.audioPlayer.state = AudioPlayerState.COMPLETED;

    Map<String, String> jsonString = {
      "ExamRoomId": Constant.examRoomId.toString(),
      "ExamIndex": (Constant.examIndex + 1).toString(),
    };
    var result = await HttpService.postTestToken(
        Constant.Chat_Api_URL + "room/GetExam", jsonString);
    if (result == null) return;
    var jsonStr = json.decode(result);
    ExampleContent().init(jsonStr);
    setState(() {
      Constant.isPlay = true;
      Constant.examIndex++;
      if (Constant.examIndex < Constant.examLength - 1)
        _isButtonDisabled = true;
      else
        _isFinishDisabled = true;
      print("refresh");
    });
  }

  finishExample() async {
    Map<String, String> jsonString = {
      "JsonArray": Answer().getAll().toString(),
      "MemberId": Cookie.id.toString(),
      "ExamRoomId": Constant.examRoomId.toString(),
    };

    var result = await HttpService.postTestToken(
        Constant.Chat_Api_URL + "room/FinalExam", jsonString);
    if (result == null) return;
    var jsonStr = json.decode(result);
    print(jsonStr);
    Grade.voiceCorrect = jsonStr["voiceCorrect"];
    Grade.readCorrect = jsonStr["readCorrect"];
    Grade.voiceTotal = jsonStr["voiceTotal"];
    Grade.readTotal = jsonStr["readTotal"];
    Grade.voiceScore = jsonStr["voiceScore"];
    Grade.readScore = jsonStr["readScore"];
    Navigator.push(
        mcontext,
        MaterialPageRoute(
            builder: (mcontext) => GradeView(), maintainState: false));
  
  }
}
