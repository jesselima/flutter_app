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

  bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
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
              Opacity(
                opacity: _isVisible ? 1.0 : 0.0,
                child: Text(_value),
              ),
              RaisedButton(onPressed: _toggleVisibility, child: Text("Toggle Vivibility/Opacity"),)
            ],
          ),
        ),
      ),
    );
  }

}
