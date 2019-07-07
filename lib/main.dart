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

  // Radios need a initial values
  double _value = 0.0;

  void _setValue(double value) =>  setState(() => _value = value);


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
              Text('Value ${(_value * 100).round()}'),
              Slider(value: _value, onChanged: _setValue)
            ],
          ),
        ),
      ),
    );
  }

}

