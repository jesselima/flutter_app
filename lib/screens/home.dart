import 'package:flutter/material.dart';

import '../code/globalstate.dart';

void main() => runApp(
    new MaterialApp(
      home: Home()
    )
);


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    super.initState();
    _store.set("value", 0);

  }

  void _increment() {
    int value = _store.get("value");
    value++;
    setState(() => _store.set("value", value));
  }

  void _decrement() {
    int value = _store.get("value");
    value--;
    setState(() => _store.set("value", value));
  }

  void _onPressed(){
    Navigator.of(context).pushNamed("/Second");
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

              IconButton(icon: Icon(Icons.add), onPressed: _increment,),
              IconButton(icon: Icon(Icons.remove), onPressed: _decrement,),
              RaisedButton(
                onPressed: _onPressed,
                child:  Text("Next"),
              ),
              Text("Value ${_store.get("value")}")
            ],
          ),
        ),
      ),
    );
  }

}
