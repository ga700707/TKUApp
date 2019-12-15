import 'Page1Widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(Page1());

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[100],
        appBar: AppBar(
          title: Text('CTes111t'),
        ),
        body: Page1Body(),
      ),
    );
  }
}

class Page1Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    mcontext = context;
    return Center(
      child: Center(
        
        child: checkBtn())
    );
  }
}
