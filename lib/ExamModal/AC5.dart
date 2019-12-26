import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class AC5 extends StatelessWidget {
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
                //GetHeaderBtn(),
                //VoiceSlider(),
                GetTxtExample(0),
                GetPicABC(0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
