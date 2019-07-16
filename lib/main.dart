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
  String _value = "Hello World!";

  void _onClick() => setState(() => _value = DateTime.now().toString());

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
              Text(_value),
              IconButton(
                icon: Icon(Icons.timer),
                onPressed: _onClick,
                tooltip: "Click me!",
              )
            ],
          ),
        ),
      ),
    );
  }

}
