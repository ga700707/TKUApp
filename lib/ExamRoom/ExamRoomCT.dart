import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctestapp/ExamModal/AC1.dart';
import 'package:ctestapp/ExamModal/AC2.dart';
import 'package:ctestapp/ExamModal/AC3.dart';
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
  Duration duration;
  Duration position;
  AudioPlayer audioPlayer;
  // PlayerState playerState = PlayerState.playing;

  // get isPlaying => playerState == PlayerState.playing;
  // get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';
  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;

  StreamSubscription _positionSubscription;
  StreamSubscription _audioPlayerStateSubscription;
  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    OrientationPlugin.forceOrientation(DeviceOrientation.landscapeLeft);
  }

  @override
  void dispose() {
    // _positionSubscription.cancel();
    // _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    if (Constant.turnScreen)
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    Constant.turnScreen = true;
    print("Dispose");
    super.dispose();
  }

  void initAudioPlayer() async {
    audioPlayer = new AudioPlayer();
    VoicePlay().init(audioPlayer);
  }

  void onComplete() {
    //setState(() => playerState = PlayerState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    MaxSize().initWH(context);
    print("=============");

    print(ExampleContent.category.toString());

    switch (ExampleContent.category) {
      case 0:
        return Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 20),
              child: AC1()),
        );
      case 1:
        return Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 20),
              child: AC2()),
        );
      case 2:
        return Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 20),
              child: AC3()),
        );
      default:
        return Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 20),
              child: AC1()),
        );
    }
  }
}
