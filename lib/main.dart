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


class AnimatedLogo extends AnimatedWidget {

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);
  static final _rotateTween = Tween<double>(begin: 0.0, end: 12.0);

  AnimatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Transform.rotate(angle: _rotateTween.evaluate(animation),
      child: Opacity(opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: _sizeTween.evaluate(animation),
        width: _sizeTween.evaluate(animation),
        child: FlutterLogo(),
      ),),),
    );

  }
}

class _State extends State<MyApp> with TickerProviderStateMixin {

  String _appBarName = "Flutter App";

  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);

    animation.addStatusListener(listener);
    animationController.forward();

  }

  void listener(AnimationStatus status) {
    if(status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
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
        padding: EdgeInsets.all(32),
        child: AnimatedLogo(animation: animation),
      ),
    );
  }

}
