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
  bool _value1 = false;
  bool _value2 = false;

  void _onChangeValue1(bool value) =>  setState(() => _value1 = value);
  void _onChangeValue2(bool value) =>  setState(() => _value2 = value);


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
              Switch(
                  value: _value1, 
                  onChanged: _onChangeValue1,
              ),
              SwitchListTile(
                value: _value2,
                onChanged: _onChangeValue2,
                title: Text(
                  "Notifications",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

}

