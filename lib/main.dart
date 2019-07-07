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
  String _value = "";

  void _onChanged(String value) {
    setState(() => _value = "Change: $value");
  }

  void _onSubmit(String value) {
    setState(() => _value = "Submit: $value");
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
              Text('$_value'),
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Type your name",
                  icon: Icon(Icons.people)
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _onChanged,
                onSubmitted: _onSubmit,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Type your email",
                    icon: Icon(Icons.email)
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Weight",
                    hintText: "How heavy are you?",
                    icon: Icon(Icons.restaurant)
                ),
                keyboardType: TextInputType.number,
              )
            ],
          ),
        ),
      ),
    );
  }
}
