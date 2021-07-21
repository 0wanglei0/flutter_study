import 'package:flutter/material.dart';

class RouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("route"),
        ),
        body: Center(
          child: Text("test"),
        ),
      ),
    );
  }
}