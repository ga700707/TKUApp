import 'package:ctestapp/Base/BaseStyle.dart';
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
                  children: <Widget>[
                    GetPicExampleGroup(),
                    //for (var i = 0; i < 3; i++)
                    Expanded(
                      child: Column(children: <Widget>[
                        for (var i = 0; i < ExampleContent.contentLength; i++)
                          Container(
                            child: Column(children: <Widget>[
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 16.0),
                                  child: Text(
                                    "(" + (i + 1).toString() + ")",
                                    style: nomalStyle(),
                                  ),
                                ),
                                GetTxtExample(i),
                              ]),
                              GetGroupAnswerTxtBtn(3, i),
                            ]),
                          ),
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
