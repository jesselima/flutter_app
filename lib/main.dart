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

class _State extends State<MyApp> {

  String _appBarName = "Flutter App";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Image demo:"),
              Text("Local:"),
              // TODO -> WORKING
              Expanded(child: Image.asset("images/google-flutter-logo.png")),
              Text("Network:"),
              // TODO -> NOT WORKING
              Expanded(child: Image.network('http://jesselima.tech/img/jesse.jpg')),
              Expanded(child: Image.network('https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true')),
              Expanded(child: Image.network('https://picsum.photos/250?image=9'))
          ],
          ),
        ),
      ),
    );
  }

}

