import 'package:flutter/animation.dart';
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

class _State extends State<MyApp> with SingleTickerProviderStateMixin {

  String _appBarName = "Flutter App";

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    animation.addListener((){
      setState(() {
        // The state of the animation has changed. Here we track animation current state.

      });
    });

    // START THE ANIMATION
    animationController.forward();
  }

  // TODO Info ->  IF YOU DO NOT DISPOSE ANIMATION KEEP RUNNING ON BACKGROUND. AND THAT'S BAD!
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
        width: animation.value,
        height: animation.value,
        padding: EdgeInsets.all(32.0),
              child: Center(child: FlutterLogo(size: 300))
      )
    );
  }

}
