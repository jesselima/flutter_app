import 'package:flutter/material.dart';

import 'clock.dart';
import 'mywidget.dart';

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


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Title Text"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              MyWidget(),
              Text("My Custom View With Clock"),
              Clock()
            ],
          ),
        ),
      ),
    );
  }

}
