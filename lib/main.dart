import 'dart:async';

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
  String _value = "";

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2020)
    );
    if(picked != null) {
      setState(() {
        _value = picked.toString();
      });
    }
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
              RaisedButton(
                onPressed: _selectDate,
                child: Text("Click me"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

