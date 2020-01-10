//   扇形图
import 'dart:math';

import 'package:flutter/material.dart';

import 'MyView.dart';

class PieChart extends StatefulWidget {
  final PieDescribe describe; // 扇形图具体信息
  final ExtraValues values = new ExtraValues(); // 乱七八糟的其他相关信息 ---> 为了改的时候好找

  PieChartState state;

  PieChart(this.describe);

  @override
  State<StatefulWidget> createState() {
    state = new PieChartState(describe, values);
    return state;
  }

  void changePies(PieDescribe describe) {
    state.changePies(describe);
  }
}

class PieChartState extends State<PieChart> with TickerProviderStateMixin {
  final ExtraValues values; // 乱七八糟的其他相关信息
  PieDescribe describe; // 扇形图具体信息

  // 动画相关
  AnimationController controller;
  CurvedAnimation animation;

  // 绘制相关
  PiesPainter painter;

  PieChartState(this.describe, this.values);

  @override
  void initState() {
    super.initState();
    //  初始化动画Controller与Animation，系统提供了CurvedAnimation,封装了各种不同类型的物理动画
    controller = new AnimationController(
        vsync: this, duration: values.animationduration);
    animation =
        new CurvedAnimation(parent: controller, curve: Curves.easeOut);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    List<double> radians = initValues();
    
    painter = new PiesPainter(
        radians, describe.colors, values, animation, values.startradians);

    return new SizedBox.expand(
      child: new CustomPaint(painter: painter),
    );
  }

  //  数值计算 ---> 每个扇形所占的弧度
  List<double> initValues() {
    // 弧度的数组
    List<double> radians = new List<double>();
    // 取传进来的所有的值的和
    num totalvalue = 0.0;
    describe.values.forEach((num) {
      totalvalue += num;
    });
    // 计算每个元素的弧度 ---> 然后返回结果
    describe.values.forEach((num) {
      double theradians = num / totalvalue * 2 * pi;
      radians.add(theradians);
    });
    return radians;
  }

  //  改变传入的数据
  void changePies(PieDescribe describe) {
    this.describe = describe;
    List<double> radians = initValues();
    painter.changeRadians(radians, describe.colors);
    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
