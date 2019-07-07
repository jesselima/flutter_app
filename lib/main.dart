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
  int _value = 0;

  void _add(){
    setState(() {
      _value++;
    });
  }

  void _subtract(){
    setState(() {
      _value--;
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
              Text('Value: $_value'),
              IconButton(icon: Icon(Icons.add), onPressed: _add),
              IconButton(icon: Icon(Icons.remove), onPressed: _subtract)
            ],
          ),
        ),
      ),
    );
  }

}
