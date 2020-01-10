import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:ctestapp/Base/AudioProvider.dart';
import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/BaseStyle.dart';
import 'package:ctestapp/Login/LoginStyle.dart';
import 'package:flutter/material.dart';
import '../Base/BaseConstant.dart';

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
      padding: EdgeInsets.all(8.0),
      child: Text(
        ExampleContent.txtExample[index],
        style: nomalStyle(),
      ),
    );
  }
}

class GetTxtExampleGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8.0),
      width: MaxSize.width * 0.8,
      child: Text(
        ExampleContent.txtExampleGroup,
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
      child: new Image.memory(ExampleContent.picExample,
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
                    Answer().add(ExampleContent.id[0], i);
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
  final int btnNumber;
  final int exampleNumber;
  GetAnswerTxtBtn(this.btnNumber, this.exampleNumber);
  @override
  GetAnswerTxtBtnBody createState() => GetAnswerTxtBtnBody();
}

class GetAnswerTxtBtnBody extends State<GetAnswerTxtBtn> {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  var answer = ["A", "B", "C", "D", "E", "F"];
  List<List<bool>> check = new List<List<bool>>();
  List<List<String>> answerTxt = new List<List<String>>();

  var btnNumber;
  var exampleNumber;
  @override
  void initState() {
    initExampleContent();
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initExampleContent();
  }

  initExampleContent() {
    btnNumber = widget.btnNumber;
    exampleNumber = widget.exampleNumber;

    check.clear();
    answerTxt.clear();
    check.add([false, false, false, false, false, false]);
    answerTxt.add([
      ExampleContent.txtA[exampleNumber],
      ExampleContent.txtB[exampleNumber],
      ExampleContent.txtC[exampleNumber],
      ExampleContent.txtD[exampleNumber],
      ExampleContent.txtE[exampleNumber],
      ExampleContent.txtF[exampleNumber],
    ]);
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
            for (var j = 0; j < btnNumber; j++)
              FlatButton(
                  color: (check[exampleNumber][j])
                      ? Color.fromARGB(200, 255, 255, 0)
                      : Colors.green[200],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Color.fromARGB(200, 255, 255, 0),
                  onPressed: () {
                    Answer().add(ExampleContent.id[exampleNumber], j);
                    setState(() {
                      for (var k = 0; k < btnNumber; k++) {
                        if (j == k)
                          check[exampleNumber][k] = true;
                        else
                          check[exampleNumber][k] = false;
                      }
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '(' + answer[j] + ')' + answerTxt[exampleNumber][j],
                      style: btntext(),
                    ),
                  )),
          ]),
    );
  }
}

class GetGroupAnswerTxtBtn extends StatefulWidget {
  final int btnNumber;
  final int exampleNumber;
  GetGroupAnswerTxtBtn(this.btnNumber, this.exampleNumber);
  @override
  GetGroupAnswerTxtBtnBody createState() => GetGroupAnswerTxtBtnBody();
}

class GetGroupAnswerTxtBtnBody extends State<GetGroupAnswerTxtBtn> {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  var answer = ["A", "B", "C", "D", "E", "F"];
  List<bool> check = new List<bool>();
  List<List<String>> answerTxt = new List<List<String>>();

  var btnNumber;
  var exampleNumber;
  @override
  void initState() {
    initExampleContent();
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initExampleContent();
  }

  initExampleContent() {
    btnNumber = widget.btnNumber;
    exampleNumber = widget.exampleNumber;

    check.clear();
    answerTxt.clear();
    check = [false, false, false, false, false, false];
    answerTxt.add([
      ExampleContent.txtA[exampleNumber],
      ExampleContent.txtB[exampleNumber],
      ExampleContent.txtC[exampleNumber],
      ExampleContent.txtD[exampleNumber],
      ExampleContent.txtE[exampleNumber],
      ExampleContent.txtF[exampleNumber],
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (var j = 0; j < btnNumber; j++)
              FlatButton(
                  color: (check[j])
                      ? Color.fromARGB(200, 255, 255, 0)
                      : Colors.green[200],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Color.fromARGB(200, 255, 255, 0),
                  onPressed: () {
                    Answer().add(ExampleContent.id[exampleNumber], j);
                    setState(() {
                      for (var k = 0; k < btnNumber; k++) {
                        if (j == k)
                          check[k] = true;
                        else
                          check[k] = false;
                      }
                    });
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '(' + answer[j] + ')' + answerTxt[0][j],
                      style: btntext(),
                    ),
                  )),
          ]),
    );
  }
}

class GetGroupAnswerTxtLabel extends StatefulWidget {
  final int btnNumber;
  final int exampleNumber;
  GetGroupAnswerTxtLabel(this.btnNumber, this.exampleNumber);
  @override
  GetGroupAnswerTxtLabelBody createState() => GetGroupAnswerTxtLabelBody();
}

class GetGroupAnswerTxtLabelBody extends State<GetGroupAnswerTxtLabel> {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  var answer = ["A", "B", "C", "D", "E", "F"];
  List<List<String>> answerTxt = new List<List<String>>();
  var btnNumber;
  var exampleNumber;
  @override
  void initState() {
    initExampleContent();
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initExampleContent();
  }

  initExampleContent() {
    btnNumber = widget.btnNumber;
    exampleNumber = widget.exampleNumber;
    answerTxt.clear();
    answerTxt.add([
      ExampleContent.txtA[exampleNumber],
      ExampleContent.txtB[exampleNumber],
      ExampleContent.txtC[exampleNumber],
      ExampleContent.txtD[exampleNumber],
      ExampleContent.txtE[exampleNumber],
      ExampleContent.txtF[exampleNumber],
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          for (var i = 0; i < btnNumber / 2; i++)
            Row(
              children: <Widget>[
                for (var j = i * 2; j < i * 2 + 2; j++)
                  Container(
                      padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                      margin: EdgeInsets.all(8.0),
                      // height: MaxSize.height * 0.12,
                      width: MaxSize.width * 0.3,
                      color: Colors.blueGrey[200],
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '(' + answer[j] + ')' + answerTxt[0][j],
                          style: btntext(),
                        ),
                      )),
              ],
            ),
        ],
      ),
    );
  }
}

class GetOptionAnswerTxtBtn extends StatefulWidget {
  final int btnNumber;
  final int exampleNumber;
  GetOptionAnswerTxtBtn(this.btnNumber, this.exampleNumber);
  @override
  GetOptionAnswerTxtBtnBody createState() => GetOptionAnswerTxtBtnBody();
}

class GetOptionAnswerTxtBtnBody extends State<GetOptionAnswerTxtBtn> {
  static Color colorBlack = Color.fromARGB(255, 0, 0, 0);
  var answer = ["A", "B", "C", "D", "E", "F"];
  List<bool> check = new List<bool>();
  List<int> selectItemValue = new List<int>();

  var btnNumber;
  var exampleNumber;
  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = new List();
    for (var i = 0; i < 6; i++) {
      DropdownMenuItem item1 = new DropdownMenuItem(
          value: i,
          child: new Text(
            answer[i],
            style: nomalStyle(),
          ));
      items.add(item1);
    }
    return items;
  }

  @override
  void initState() {
    initExampleContent();
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    initExampleContent();
  }

  initExampleContent() {
    btnNumber = widget.btnNumber;
    exampleNumber = widget.exampleNumber;
    check.clear();
    selectItemValue.clear();
    check = [false, false, false, false, false, false];
    selectItemValue = [null, null, null, null, null, null];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var i = 0; i < btnNumber / 2; i++)
            Row(
              children: <Widget>[
                for (var j = i * 2; j < i * 2 + 2; j++)
                  if (j < btnNumber)
                    Container(
                      color: (check[j])
                          ? Color.fromARGB(255, 255, 255, 100)
                          : Colors.green[200],
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      height: MaxSize.width / 10,
                      width: MaxSize.width / 10,
                      alignment: Alignment.center,
                      child: DropdownButton(
                        hint: new Text(
                          (j + 1).toString(),
                          style: nomalStyle(),
                        ),

                        //设置这个value之后,选中对应位置的item，
                        //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
                        value: selectItemValue[j],
                        icon: Icon(Icons.check),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),

                        items: generateItemList(),
                        onChanged: (T) {
                          Answer().add(ExampleContent.id[j], T);
                          setState(() {
                            selectItemValue[j] = T;
                            check[j] = true;
                          });
                        },
                      ),
                    ),
              ],
            ),
        ],
      ),
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
    var pic = [ExampleContent.picA, ExampleContent.picB, ExampleContent.picC];

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
                Answer().add(ExampleContent.id[0], i);
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
    if (Constant.isPlay) play(ExampleContent.voiceExample);
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
    if (Constant.isPlay) play(ExampleContent.voiceExample);
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
    print(url);
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
