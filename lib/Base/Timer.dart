import 'dart:async';

import 'package:flutter/material.dart';

import 'BaseStyle.dart';

class Countdown extends StatefulWidget {
  @override
  _CountdownState createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  Timer _timer;
  int seconds;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(constructTime(seconds),style: timeStyle()),
    );
  }

  //時間格式化，根據總秒數轉換為對應的 hh:mm:ss 格式
  String constructTime(int seconds) {
    int hour = seconds ~/ 3600;
    int minute = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    return formatTime(hour) +
        ":" +
        formatTime(minute) +
        ":" +
        formatTime(second);
  }

  //數字格式化，將 0~9 的時間轉換為 00~09
  String formatTime(int timeNum) {
    return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
  }

  @override
  void initState() {
    super.initState();
    //獲取當期時間
    var now = DateTime.now();
    //獲取 2 分鐘的時間間隔
    var twoHours = now.add(Duration(hours: 2)).difference(now);
    //獲取總秒數，2 分鐘為 120 秒
    seconds = twoHours.inSeconds;
    startTimer();
  }

  void startTimer() {
    //設定 1 秒回撥一次
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      //更新介面
      //seconds--;
      //print(seconds);

      setState(() {
        //秒數減一，因為一秒回撥一次
        seconds--;
      });
      if (seconds == 0) {
        //倒數計時秒數為0，取消定時器
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}
