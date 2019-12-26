import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class AC7 extends StatelessWidget {
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
                Row(
                  //mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GetPicExampleGroup(),
                    // new Flexible(
                    //   child: GetAnswerTxtBtn(index: 3),
                    // )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
