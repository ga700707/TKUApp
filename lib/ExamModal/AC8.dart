import 'package:ctestapp/Base/BaseStyle.dart';
import 'package:flutter/material.dart';

import '../Base/BaseConstant.dart';
import 'ModalWidget.dart';

class AC8 extends StatelessWidget {
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
                GetTxtExampleGroup(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    GetGroupAnswerTxtLabel(6, 0),
                    GetOptionAnswerTxtBtn(6, 0),
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
