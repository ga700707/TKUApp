import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class ACExample extends StatelessWidget {
  static AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MaxSize.width,
      height: MaxSize.height * 0.8,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                GetIndexExample(),
                VoiceSlider(),
                Text("exampletitle"),
                //HeaderWidget("example"),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: MaxSize.width / 40,
              crossAxisSpacing: MaxSize.width / 40,
              childAspectRatio: 5,
            ),
            delegate: SliverChildListDelegate(
              [
                BodyText("(A)"),
                BodyText("(B)"),
                BodyText("(C)"),
              ],
            ),
          ),
          //GetPicABC(),
        ],
      ),
    );
  }
}
