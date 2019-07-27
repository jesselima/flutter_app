import 'package:flutter/material.dart';

// TODO declare final global objects here

class Second extends StatefulWidget {

  // IMPORTANT: TO BE ABLE TO PASS VALUE THOUGH ROUTES WE NEED CHANGE THE CONSTRUCTOR
  // THEN WE CAN PASS THE VALUE THE WAY DOWN THROUGH THE STATE
  Second(this.name);
  String name;

  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<Second> {

  //GlobalState _store = GlobalState.instance;
  _SecondState(this.name);
  String name;

  @override
  void initState() {
    super.initState();
    // TODO implement state here

  }

  void _onClick(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Second"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              //Text("Hello ${_store.get("name")}"),
              Text("Hello $name"),
              RaisedButton(onPressed: (){ Navigator.of(context).pop(); }, child: Text("Back")),
            ],
          ),
        ),
      ),
    );
  }

}
