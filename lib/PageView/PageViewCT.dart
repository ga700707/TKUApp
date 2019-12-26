import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';

// import './car_page.dart';
// import './my_page.dart';
// import './index_page.dart';

class PageViewCT extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
  
}

//要混入SingleTickerProviderStateMixin
class _HomePageState extends State<PageViewCT>
    with SingleTickerProviderStateMixin {
  //这是监听安卓的返回键操作
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('退出App?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('不'),
              ),
              new FlatButton(
                onPressed: () async {
                  await pop();
                },
                child: new Text('是的'),
              ),
            ],
          ),
        ) ??
        false;
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  //建立下面三个按钮数组
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("备用")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text("我的"))
  ];
  //把3个页面排成数组形式方便切换
  final List<Widget> tabBodies = [
    // IndexPage(),
    // CarPage(),
    // MyPage(),
  ];

  int currentIndex = 0;
  //创建页面控制器
  var _pageController;
  @override
  void initState() {
    //页面控制器初始化
    _pageController = new PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //WillPopScope监听安卓返回键
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            //点击下面tabbar的时候执行动画跳转方法
            _pageController.animateToPage(index,
                duration: new Duration(milliseconds: 500),
                curve: new ElasticOutCurve(4));
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            switch (index % 3) {
              case 0:
                return new Center(
                  child: Page1(),
                );
              case 1:
                return new Center(
                  child: ClsPage2(),
                );

              case 2:
                return new Center(
                  child: ClsPage3(),
                );
            }
            return new Center(
              child: Page1(),
            );
          },
          onPageChanged: (index) {
            currentIndex = index;
            setState(() {
              currentIndex = index % 3;
            });
            print(index);
          },
        ),
      ),
    );
  }
}
