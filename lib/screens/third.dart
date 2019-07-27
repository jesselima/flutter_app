import 'package:flutter/material.dart';

import '../code/globalstate.dart';

void main() => runApp(
    new MaterialApp(
      home: Third()
    )
);

class Third extends StatefulWidget {
  @override
  _Third createState() => new _Third();
}

class _Third extends State<Third> {

  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Third"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Third Page"),
              RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Second"); }, child: Text("Second")),
              RaisedButton(onPressed: (){ Navigator.of(context).pushNamedAndRemoveUntil("/Home", (Route<dynamic> route) => false); }, child: Text("HOME (clear history)")), // RETURN TO HOME WITHOUT STACK HISTORY
              Text("Value ${_store.get("value")}"),
            ],
          ),
        ),
      ),
    );
  }

}
