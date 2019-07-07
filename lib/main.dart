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

  int _value = 0;
  String dateView = "";

  void _add() =>  setState(() =>  _value++);
  void _remove() => setState(() => _value--);
  void _onClick() => setState(() => dateView = DateTime.now().toString());


  @override
  Widget build(BuildContext context) {
    // build refer to "render". To render something into the screen.
    return new Scaffold(

      appBar: AppBar(
        title: Text(_appBarName),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _add),
          IconButton(icon: Icon(Icons.remove), onPressed: _remove)
        ],
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: _onClick,
        backgroundColor: Colors.red,
        mini: true,
        child: Icon(Icons.timer),
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37
                ),
              ),
              Text(dateView)
            ],
          ),
        ),
      ),

    );
  }

}

