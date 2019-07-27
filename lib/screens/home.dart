import 'package:flutter/material.dart';
import 'package:flutter_app/screens/second.dart';

void main() => runApp(
    new MaterialApp(
      home: Home()
    )
);


class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

  TextEditingController _name;
  //GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    //_store.set("name", "");
    //_name.text = _store.get("name");
  }

  // IMPORTANT - WE DO NOT NEED TO USE SET STATE METHOD INSIDE _onPressed() UNLESS WE NEED TO NOTIFY SOMEONE ABOUT THE STATE CHANGE
  void _onPressed(){
    //_store.set("name", _name.text);
    //Navigator.of(context).pushNamed("/Second");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Second(_name.text), // THIS IS THE INFORMATION TO BE PASSED THROUGH THE CONSTRUCTOR.
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Home Page"),
              TextField(
                controller: _name,
                decoration: InputDecoration(labelText: "Enter your name"),
              ),
              RaisedButton(onPressed: _onPressed, child: Text("Next")),
            ],
          ),
        ),
      ),
    );
  }

}
