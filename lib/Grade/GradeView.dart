import 'package:ctestapp/Grade/MyView.dart';
import 'package:ctestapp/Grade/PieChart.dart';
import 'package:flutter/material.dart';
import 'package:ctestapp/Base/BaseConstant.dart';

class GradeView extends StatelessWidget {
  final List<PieDescribe> pies = [
    new PieDescribe(
        values: [400, 200, 300, 800],
        colors: [Colors.red, Colors.blue, Colors.yellow, Colors.green]),
    new PieDescribe(
        values: [100-Grade.voiceScore-Grade.readScore,Grade.voiceScore+Grade.readScore ],
        colors: [Colors.red, Colors.blue]),
    new PieDescribe(
        values: [700, 800, 400, 600],
        colors: [Colors.red, Colors.blue, Colors.yellow, Colors.green])
  ];
  int _currentNum = 0;
  @override
  Widget build(BuildContext context) {
    PieChart pieChart = new PieChart(pies[1]);
    return new Material(
      color: Colors.lightBlue[100],
      child: new Center(
        child: new InkWell(
          child: new SizedBox(
            width: 300.0,
            height: 300.0,
            child: pieChart,
          ),
          onTap: () {
            if (_currentNum < 2) {
              _currentNum++;
            } else {
              _currentNum = 0;
            }
            pieChart.changePies(pies[1]);
          },
        ),
      ),
    );
  }
}
