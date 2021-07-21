import 'package:flutter/material.dart';
import 'package:flutterapptest/CustomAppBar.dart';

//void main() {
//  runApp(MyApp());
//}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new CustomAppBar(
          title: '微防伪',
          trailingWidget: null,
        ),
        body: Center(
          child: Text("123"),
        ),
      ),
    );
  }
}