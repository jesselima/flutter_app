import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(home: MyApp()));

// Attention for the circular reference for MyApp. Why?
//...

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  String _appBarName = "Flutter App";
  bool _value1 = false;
  bool _value2 = false;

  void _valeu1Changed(bool value) =>  setState(() => _value1 = value);
  void _valeu2Changed(bool value) =>  setState(() => _value2 = value);


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
              Checkbox(
                value: _value1,
                onChanged: _valeu1Changed
              ),
              CheckboxListTile(
                value: _value2,
                onChanged: _valeu2Changed,
                title: Text("I Agree"),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: Text("I confirm I read the terms."),
                secondary: Icon(Icons.assignment),
                activeColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
