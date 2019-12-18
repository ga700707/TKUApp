import 'dart:convert';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctestapp/Base/AudioProvider.dart';
import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/BaseStyle.dart';
import 'package:ctestapp/ExamRoom/ExamRoomCT.dart';
import 'package:ctestapp/Login/LoginStyle.dart';
import 'package:ctestapp/Login/LoginWidget.dart';
import 'package:flutter/material.dart';
import '../Base/BaseConstant.dart';
import '../Base/Request.dart';

class ExamRoomWidget {
  static AudioPlayer audioPlayer;
  Future<void> test() async {
    Map<String, String> jsonString = {
      "ExamRoomId": Constant.examRoomId.toString(),
      "ExamIndex": "1",
    };
    print(jsonString);
    var result = await HttpService.postTestToken(
        Constant.Chat_Api_URL + "room/GetExam", jsonString);
    if (result == null) return;
    var jsonStr = json.decode(result);
    var content = jsonStr["examplecontent"][0];
    ExampleContent().init(content["voiceExample"]);
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;
  HeaderWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;

  BodyText(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      height: 20.0,
      alignment: Alignment.center,
    );
  }
}

class GetIndexExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text((Constant.examIndex + 1).toString() + ".", style: btnStyle()),
    );
  }
}

class GetHeaderBtn extends StatelessWidget {
  static BuildContext mcontext;

  @override
  Widget build(BuildContext context) {
    mcontext = context;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 60),
      width: MaxSize.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text((Constant.examIndex + 1).toString() + ".", style: btnStyle()),
            Container(
              height: MaxSize.height / 10,
              alignment: Alignment.centerRight,
              child: RaisedButton(
                textTheme: ButtonTextTheme.accent,
                highlightColor: Colors.lightBlue[100],
                color: Colors.lightBlue[400],
                shape: new BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: new BorderSide(style: BorderStyle.none)),
                child: Text(
                  "下一題",
                  style: btntext(),
                ),
                onPressed: () async {
                  getExample();
                },
              ),
            ),
          ]),
    );
  }

  getExample() async {
    Constant.examIndex++;
    Map<String, String> jsonString = {
      "ExamRoomId": Constant.examRoomId.toString(),
      "ExamIndex": Constant.examIndex.toString(),
    };
    var result = await HttpService.postTestToken(
        Constant.Chat_Api_URL + "room/GetExam", jsonString);
    if (result == null) return;
    var jsonStr = json.decode(result);
    var content = jsonStr["examplecontent"][0];
    ExampleContent().init(content);
    Constant.turnScreen=false;
    Navigator.push(
        mcontext,
        MaterialPageRoute(
            builder: (mcontext) => ExamRoomCT(), maintainState: false));
   
  }
}

class GetTxtExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(ExampleContent.txtExample),
    );
  }
}

class GetPicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MaxSize.width / 3,
      height: MaxSize.width / 3,
      child: new Image.memory(ExampleContent.picExample,
          width: MaxSize.width / 3,
          height: MaxSize.width / 3,
          fit: BoxFit.cover),
      alignment: Alignment.centerLeft,
    );
  }
}

class Get3AnswerBtn extends StatelessWidget {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);

  // static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    var answer = ["(A)", "(B)", "(C)"];

    return Container(
      padding: EdgeInsets.all(16.0),
      height: MaxSize.width / 3,
      width: MaxSize.width / 3,
      alignment: Alignment.centerLeft,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (int i = 0; i < 3; i++)
              Container(
                height: MaxSize.height / 10,
                width: MaxSize.width / 4,
                child: RaisedButton(
                  color: Colors.green[200],
                  child: Text(
                    answer[i],
                    style: btntext(),
                  ),
                  onPressed: () async {
                    //login();
                  },
                ),
              ),
          ]),
    );
  }
}

class GetPicABC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pic = [ExampleContent.picA, ExampleContent.picB, ExampleContent.picC];
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: MaxSize.width / 20,
        crossAxisSpacing: MaxSize.width / 20,
        childAspectRatio: 1,
      ),
      delegate: SliverChildListDelegate([
        for (var p in pic)
          Container(
            color: Colors.black,
            child: new Image.memory(p),
            alignment: Alignment.center,
          ),
      ]),
    );
  }
}

class VoiceSlider extends StatelessWidget {
  static double _value = 0;
  @override
  Widget build(BuildContext context) {
    play(ExampleContent.voiceExample);
    return Container(
      child: Slider(
        value: _value,
        onChanged: (newValue) {
          print('onChanged:$newValue');
          _value = newValue;
        },
        onChangeStart: (startValue) {
          print('onChangeStart:$startValue');
        },
        onChangeEnd: (endValue) {
          print('onChangeEnd:$endValue');
        },
        divisions: 5,
        semanticFormatterCallback: (newValue) {
          return '${newValue.round()} dollars';
        },
      ),
    );
  }

  Future play(url) async {
    AudioProvider audioProvider = new AudioProvider(url);
    String localUrl = await audioProvider.load();
    await VoicePlay.audioPlayer.play(localUrl);
  }
}
