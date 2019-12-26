
import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class AC2 extends StatelessWidget {
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
                GetABCText(),
                GetPicABC(0),

                //HeaderWidget("example"),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
