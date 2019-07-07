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

  // Radios need a initial values
  int _value1 = 0;
  int _value2 = 0;

  void _setValue1(int value) =>  setState(() => _value1 = value);
  void _setValue2(int value) =>  setState(() => _value2 = value);

  Widget makeRadios() {
    // List list = new List(); // Leads to Error: type 'List<dynamic>' is not a subtype of type 'List<Widget>'
    List<Widget> list = [];

    for(int i = 0; i < 3; i++) {
      list.add(Radio(
          value: i,
          groupValue: _value1,
          onChanged: _setValue1
        )
      );
    }

    Column column = Column(children: list);
    // Return a list inside a column
    return column;
  }


  Widget makeRadiosTile() {
    // List list = new List(); // Leads to Error: type 'List<dynamic>' is not a subtype of type 'List<Widget>'
    List<Widget> list = [];

    for(int i = 0; i < 3; i++) {
      list.add(RadioListTile(
          value: i,
          groupValue: _value2,
          onChanged: _setValue2,
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("Item $i"),
          subtitle: Text("Subtitle $i"),
        )
      );
    }

    Column column = Column(children: list);
    // Return a list inside a column
    return column;
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
              // Generate the list of radios
              makeRadios(),
              makeRadiosTile()
            ],
          ),
        ),
      ),
    );
  }
}
