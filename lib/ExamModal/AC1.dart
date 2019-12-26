import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class AC1 extends StatelessWidget {
  //static AudioPlayer audioPlayer;

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
                // GetHeaderBtn(),
                VoiceSlider(),
                Row(children: <Widget>[GetPicExample(0),Get3AnswerBtn()],)

                //HeaderWidget("example"),
              ],
            ),
          ),
      
          //GetPicABC(),
        ],
      ),
    );
  }
}
