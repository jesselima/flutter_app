import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: MyApp()
    )
);

class MyApp extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> with TickerProviderStateMixin {

  String _appBarName = "Flutter App";

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 10000), vsync: this);

    final CurvedAnimation curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curvedAnimation);

    animationController.forward();

  }

  Widget builder(BuildContext context, Widget child) {
    return Container(
      width: animation.value,
      height: animation.value,
      child: FlutterLogo(),
    );
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: AnimatedBuilder(animation: animation, builder: builder)
        ),
      ),
    );
  }

}
