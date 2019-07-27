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

  double _x;
  double _y;
  double _z;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      _x = 0.0;
      _y = 0.0;
      _z = 0.0;
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

              Row(
                children: <Widget>[
                  Text("X"),
                  Slider(value: _x, onChanged: (double value) => setState(() => _x = value),)
                ],
              ),

              Row(
                children: <Widget>[
                  Text("Y"),
                  Slider(value: _y, onChanged: (double value) => setState(() => _y = value),)
                ],
              ),

              Row(
                children: <Widget>[
                  Text("Z"),
                  Slider(value: _z, onChanged: (double value) => setState(() => _z = value),)
                ],
              ),

              Transform(transform: Matrix4.skewY(_y),
                child: Transform(transform: Matrix4.skewX(_x),
                child: Transform(transform: Matrix4.rotationZ(_z),
                child: Padding(padding: EdgeInsets.all(10), child: Text("Hello World"))
                ),),
              )

            ],
          ),
        ),
      ),
    );
  }

}
