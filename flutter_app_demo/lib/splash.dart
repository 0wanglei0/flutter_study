import 'package:flutter/material.dart';
import 'package:flutterapptest/main.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Navigation Basics',
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) :super(key : key);

  @override
  Splash createState() {
    return Splash();
  }
}

class Splash extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
            (route) => route == null,
        );

//        Navigator.push(context, MaterialPageRoute(builder: (_) {
//          return MyApp();
//        }));
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1059109819,2238091618&fm=26&gp=0.jpg",
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}