import 'dart:async';
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
    ExampleContent().init(jsonStr);
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

class GetTxtExample extends StatelessWidget {
  final int index;
  GetTxtExample(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        ExampleContent.txtExample[index],
        style: nomalStyle(),
      ),
    );
  }
}

class GetPicExample extends StatelessWidget {
  final int index;
  GetPicExample(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 0.3 * MaxSize.width,
      height: 0.3 * MaxSize.width,
      color: Colors.black,
      child: new Image.memory(ExampleContent.picExample[index],
          width: 0.3 * MaxSize.width,
          height: 0.3 * MaxSize.width,
          fit: BoxFit.cover),
      alignment: Alignment.center,
    );
  }
}

class GetPicExampleGroup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: 0.3 * MaxSize.width,
      height: 0.3 * MaxSize.width,
      color: Colors.black,
      child: new Image.memory(ExampleContent.picExampleGroup,
          width: 0.3 * MaxSize.width,
          height: 0.3 * MaxSize.width,
          fit: BoxFit.cover),
      alignment: Alignment.center,
    );
  }
}

class Get3AnswerBtn extends StatefulWidget {
  @override
  Get3AnswerBtnBody createState() => Get3AnswerBtnBody();
}

class Get3AnswerBtnBody extends State<Get3AnswerBtn> {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  var check = [false, false, false];
  // static Color colorBlack = Color.fromARGB(255, 0, 0, 0);

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    check = [false, false, false];
  }

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
                  color: (check[i])
                      ? Color.fromARGB(200, 255, 255, 0)
                      : Colors.green[200],
                  child: Text(
                    answer[i],
                    style: btntext(),
                  ),
                  onPressed: () {
                    setState(() {
                      for (var index = 0; index < 3; index++) {
                        if (i == index)
                          check[index] = true;
                        else
                          check[index] = false;
                      }
                    });
                  },
                ),
              ),
          ]),
    );
  }
}

class GetAnswerTxtBtn extends StatefulWidget {
  GetAnswerTxtBtn({Key key, this.btnNumber, this.index}) : super(key: key);
  final int btnNumber;
  final int index;
  @override
  GetAnswerTxtBtnBody createState() => GetAnswerTxtBtnBody();
}

class GetAnswerTxtBtnBody extends State<GetAnswerTxtBtn> {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  var answer = ["A", "B", "C", "D", "E", "F"];
  var check;
  var answerTxt;
  var btnNumber;
  var index;

  var mwidth;
  @override
  void initState() {
    btnNumber = widget.btnNumber;
    index = widget.index;

    check = [false, false, false, false, false, false];
    answerTxt = [
      ExampleContent.txtA[index],
      ExampleContent.txtB[index],
      ExampleContent.txtC[index],
      ExampleContent.txtD[index],
      ExampleContent.txtE[index],
      ExampleContent.txtF[index],
    ];
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    btnNumber = widget.btnNumber;
    index = widget.index;

    print("didUpdateWidget");
    check = [false, false, false, false, false, false];
    answerTxt = [
      ExampleContent.txtA[index],
      ExampleContent.txtB[index],
      ExampleContent.txtC[index],
      ExampleContent.txtD[index],
      ExampleContent.txtE[index],
      ExampleContent.txtF[index],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (int i = 0; i < btnNumber; i++)
              FlatButton(
                  color: (check[i])
                      ? Color.fromARGB(200, 255, 255, 0)
                      : Colors.green[200],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Color.fromARGB(200, 255, 255, 0),
                  onPressed: () {
                    setState(() {
                      for (var j = 0; j < index; j++) {
                        if (i == j)
                          check[j] = true;
                        else
                          check[j] = false;
                      }
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '(' + answer[i] + ')' + answerTxt[i],
                      style: btntext(),
                    ),
                  )),
          ]),
    );
  }
}

class GetABCText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var answer = ["(A)", "(B)", "(C)"];
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (var a in answer) BodyText(a),
        ],
      ),
    );
  }
}

class GetPicABC extends StatefulWidget {
  final int index;
  GetPicABC(this.index);
  @override
  GetPicABCBody createState() => GetPicABCBody(index);
}

class GetPicABCBody extends State<GetPicABC> {
  var pic = [ExampleContent.picA, ExampleContent.picB, ExampleContent.picC];
  var check = [false, false, false];
  var img = List<Image>();
  bool check2 = false;
  var color = Colors.yellow;
  final int index;
  GetPicABCBody(this.index);
  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    check = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    var pic = [
      ExampleContent.picA[index],
      ExampleContent.picB[index],
      ExampleContent.picC[index]
    ];

    print("GetPicABCBody");
    for (var p in pic) {
      img.add(new Image.memory(p,
          width: MaxSize.width / 4,
          height: MaxSize.width / 4,
          fit: BoxFit.cover));
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (var i = 0; i < 3; i++)
            MaterialButton(
              padding: EdgeInsets.all(8.0),
              textColor: (true) ? Colors.yellow : Colors.white,
              splashColor: Color(0x20C85250),
              color: (check[i]) ? Color(0xc0C85250) : Colors.white,
              elevation: 8.0,
              highlightColor: Color(0xb0C85250),

              child: Container(
                width: MaxSize.width / 4,
                height: MaxSize.width / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: MemoryImage(pic[i]),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          (check[i]) ? Color(0x30C85250) : Colors.white,
                          BlendMode.darken)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: checkStyle(),
                  ),
                ),
              ),
              // ),

              onPressed: () {
                setState(() {
                  for (var index = 0; index < 3; index++) {
                    if (i == index)
                      check[index] = true;
                    else
                      check[index] = false;
                  }
                });
              },
            ),
        ],
      ),
    );
  }
}

class VoiceSlider extends StatefulWidget {
  @override
  VoiceSliderBody createState() => VoiceSliderBody();
}

class VoiceSliderBody extends State<VoiceSlider> {
  double _value = 0;
  @override
  void initState() {
    super.initState();
    play(ExampleContent.voiceExample);
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    play(ExampleContent.voiceExample);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: _value,
        onChanged: (newValue) {
          print('onChanged:$newValue');
          //_value = newValue;
        },
        inactiveColor: Colors.black12,
        activeColor: Colors.blueAccent,
        divisions: null,
      ),
    );
  }

  Future play(url) async {
    print("play");

    AudioProvider audioProvider = new AudioProvider(url);
    String localUrl = await audioProvider.load();
    await VoicePlay.audioPlayer.play(localUrl, isLocal: true);

    VoicePlay.audioPlayer.onDurationChanged.listen((Duration d) {
      VoicePlay.audioPlayer.onAudioPositionChanged.listen((p) {
        if (VoicePlay.audioPlayer.state == AudioPlayerState.PLAYING) {
          if (this.mounted) {
            setState(() {
              _value = p.inSeconds.toDouble() / d.inSeconds.toDouble();
            });
          }
        }
        //print(_value);
      });
    });
    VoicePlay.audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
    });
  }
}
