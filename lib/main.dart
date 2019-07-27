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

  int _turns;
  double _value;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _turns = 0;
    _value = 0.0;
  }


  void _onChanged(double value){
    setState(() {
      _turns = value.toInt();
      _value = value;
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

              Slider(
                value: _value,
                onChanged: _onChanged,
                min: 0.0,
                max: 4.0,
              ),
              RotatedBox(
                quarterTurns: _turns,
                child: Text("Hello World"),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
