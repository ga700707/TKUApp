import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class AC6 extends StatelessWidget {
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
                    GetPicExample(0),
                    new Flexible(
                      child: GetAnswerTxtBtn(btnNumber: 3),
                    )
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
