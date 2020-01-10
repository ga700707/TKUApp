import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:ctestapp/Base/BaseConstant.dart';
import 'package:ctestapp/Base/BaseStyle.dart';
import 'package:flutter/material.dart';

class PiesPainter extends CustomPainter {
  final ExtraValues values;
  final CurvedAnimation animation;

  final double startradians;

  final Paint painter = new Paint();

  final List<Offset> endpoints = new List<Offset>();

  List<double> lastradians = new List<double>(); //上一次的扇形弧度数组
  List<double> radians; //当前的扇形弧度数组
  List<Color> colors; //当前的扇形颜色

  int num; // 所包含扇形的数量

  PiesPainter(
      this.radians, this.colors, this.values, this.animation, this.startradians)
      : super(repaint: animation) {
    num = radians.length;

    painter.style = PaintingStyle.fill;
    painter.strokeWidth = values.space;

    for (int i = 0; i < num; i++) {
      lastradians.add(0.0);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    //剪切画布
    Rect rect = Offset.zero & size;
  
    Offset center = Offset(size.width / 2, size.width / 2); // 扇形图的中心点
    double outerradius = size.width / 2; // 外部圆半径
    double innerradius = outerradius * values.innercircleradiuspercent; // 内部圆半径

    double piestartradians = startradians;
    double linesradians = 0.0;
    for (int i = 0; i < num; i++) {
      // 当前每个扇形弧度的计算，需要根据之前传入的Animation所返回的值来计算
      double currentradians =
          lastradians[i] + (radians[i] - lastradians[i]) * animation.value;

      // 外部圆 ---> 请自备三角函数 ---> 或者略过不看
      painter.color = colors[i];
      Rect outerrect = Rect.fromCircle(center: center, radius: outerradius);
      canvas.drawArc(outerrect, piestartradians, currentradians, true, painter);

      piestartradians = piestartradians + currentradians;
      linesradians = linesradians + currentradians;

      double endx = outerradius + outerradius * sin(linesradians);
      double endy = outerradius - outerradius * cos(linesradians);

      endpoints.add(Offset(endx, endy));
    }

    // 内部圆 ---> 请自备三角函数 ---> 或者略过不看

    painter.color = values.spacecolor;
    Rect innerrect = Rect.fromCircle(center: center, radius: innerradius);
    canvas.drawArc(innerrect, 0.0, 2 * pi, true, painter);

    // 最后绘制相邻扇形中间的间隔线
    endpoints.forEach((endpoint) {
      canvas.drawLine(center, endpoint, painter);
    });
    canvas.clipRect(rect);

    final textStyle = ui.TextStyle(
      color: Colors.black,
      fontSize: 50,
    );
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), innerradius,
        Paint()..color = Colors.lightBlue[100]);
    // draw text
    
    final paragraphStyle = ParagraphStyle(textAlign: TextAlign.center);
    final paragraphBuilder = ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText((Grade.voiceScore+Grade.readScore).toString());
    final paragraph = paragraphBuilder.build()
      ..layout(ParagraphConstraints(width: size.width));
    canvas.drawParagraph(
        paragraph, Offset(0, size.width / 2 - paragraph.height / 2));

    endpoints.clear();
  }

  //  更改属性 ---> 重绘时记录上一次的弧度值
  void changeRadians(List<double> newradians, List<Color> colors) {
    // 老数组赋值
    lastradians = radians;
    // 新数组赋值
    radians = newradians;
    // 确定绘制的循环次数 ---> 因为新数组可能大于老数组，所以只能取较大的值
    num = radians.length > lastradians.length
        ? radians.length
        : lastradians.length;
    for (int i = 0; i < num; i++) {
      // 如果新数组较大，就需要为老数组增加多余的值，0.0
      if (lastradians.length <= i) {
        lastradians.add(0.0);
      }
      // 如果老数组较大，就需要为新数组增加多余的值，0.0，并且颜色需要对应添加进来
      if (radians.length <= i) {
        radians.add(0.0);
        colors.add(this.colors[i]);
      }
    }
    // 最后设置颜色
    this.colors = colors;
  }

  @override
  bool shouldRepaint(PiesPainter old) => false;
}

class ExtraValues {
  final double startradians = -pi / 2; // 起始点的弧度
  final double innercircleradiuspercent = 0.6; // 内部圆的半径占比
  final Duration animationduration = new Duration(milliseconds: 450); // 动画时间
  final double space = 3.0; // 扇形之间的间隔
  final Color spacecolor = Colors.white; // 间隔的颜色
}

class PieDescribe {
  final List<num> values; // 数值
  final List<Color> colors; // 颜色
  PieDescribe({@required this.values, @required this.colors});
}
