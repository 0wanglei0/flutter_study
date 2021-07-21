import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double contentHeight;
  Color navigationBarBackgroundColor;
  // Widget leadingWidget;
  Widget trailingWidget;
  String title;
  CustomAppBar({
    // @required this.leadingWidget,
    @required this.title,
    this.contentHeight = 44,
    this.navigationBarBackgroundColor = const Color(0xFFB74093),
    this.trailingWidget,
  }) : super();

  @override
  State<StatefulWidget> createState() {
    return new _CustomAppbarState();
  }

  @override
  Size get preferredSize => new Size.fromHeight(contentHeight);
}

class _CustomAppbarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: widget.navigationBarBackgroundColor,
      child: new SafeArea(
        top: true,
        child: new Container(
          decoration: new UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
          ),
          height: widget.contentHeight,
          child: new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 0,
                child: new Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: _backButtonWidget(),
                ),
              ),
              new Container(
                child: new Text(widget.title,
                  style: new TextStyle(
                    fontSize: 17, color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: new Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: widget.trailingWidget,
                ),
              )
            ],
          )
        )),
    );
  }
}

class _backButtonWidget extends StatelessWidget {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        // onPressed: ()=> exit(0),
        onPressed: () async {
          if (count == 2) {
            await pop();
          } else {
            count = count + 1;
            Scaffold.of(context).showSnackBar(
                SnackBar(
                    content: Text("再次点击退出程序"),
                    duration: new Duration(seconds: 3),
                  // shape: ShapeBorderTween,
                ));
          }
        },
        icon: new Icon(Icons.arrow_back_ios)
    );
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
  }
}



















