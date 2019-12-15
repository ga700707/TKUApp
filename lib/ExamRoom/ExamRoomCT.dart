import 'package:audioplayers/audioplayers.dart';
import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:flutter/material.dart';

import '../Base/AudioProvider.dart';

void main() => runApp(ExamRoomCT());

class ExamRoomCT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CTest'),
        ),
        body: ExamRoomBody(),
      ),
    );
  }
}

class ExamRoomBody extends StatelessWidget {
  static String url =
      'https://codingwithjoe.com/wp-content/uploads/2018/03/applause.mp3';
  AudioPlayer audioPlayer = new AudioPlayer();
  AudioProvider audioProvider = new AudioProvider(url);
  @override
  Widget build(BuildContext context) {
    //mcontext = context;

    double _value = 0;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MaxSize.width / 10),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: MaxSize.height / 80),
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
              label: '$_value dollars',
              divisions: 5,
              semanticFormatterCallback: (newValue) {
                return '${newValue.round()} dollars';
              },
            ),
          ),
        ]),
      ),
    );
  }
}
