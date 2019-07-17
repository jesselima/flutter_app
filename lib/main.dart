import 'dart:math';

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

class Area {
  int index;
  String name;
  Color color;

  Area({this.index: - 1, this.name: "Area", this.color: Colors.lightBlueAccent});
}

class _State extends State<MyApp> {

  int _location;
  List<Area> _areas;

  @override
  void initState() {
    super.initState();

    _areas = List<Area>();
    for(int i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: "Area $i"));
    }

    var randomNumber = Random(); // Generates a random with the range = to the length
    _location = randomNumber.nextInt(_areas.length);
  }

  Widget _generate(int index) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(5),
        child: RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: Text(_areas[index].name, textAlign: TextAlign.center,),
        ),
      ),
    );
  }

  void _onPressed(int index) {
    setState(() {
      if(index == _location) {
        _areas[index].color = Colors.green;
      }else {
        _areas[index].color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Title Text"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: GridView.count(
              crossAxisCount: 4,
            children: List<Widget>.generate(16, _generate),
          ),
        ),
      ),
    );
  }

}
