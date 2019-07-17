import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: MyApp()
    )
);

// TODO declare final global objects here

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  // TODO Declare state objects here


  @override
  void initState() {
    super.initState();
    // TODO implement state here

  }

  String _appBarName = "Flutter App";
  String _someTextValue = "Hello World!";

  void _onClick(){
    setState(() {
      _someTextValue = "Text clicked and state changed";
    });
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
          child: Column(
            children: <Widget>[
              Text(_someTextValue),
              RaisedButton(onPressed: _onClick, child: Text("Hello black Hole"))
            ],
          ),
        ),
      ),
    );
  }

}
