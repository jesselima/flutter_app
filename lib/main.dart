import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: MyApp()
    )
);

// Attention for the circular reference for MyApp. Why?
//...

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  String _appBarName = "Flutter App";
  String _value = "Hello World!";

  void _onClick(){
    setState(() {
      _value = "Text clicked and state changed";
    });
  }


  @override
  Widget build(BuildContext context) {
    // build refer to "render". To render something into the screen.
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
              RaisedButton(onPressed: _onClick, child: Text("Change Text"))
            ],
          ),
        ),
      ),
    );
  }

}
