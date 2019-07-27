import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: Third()
    )
);

// TODO declare final global objects here

class Third extends StatefulWidget {
  @override
  _Third createState() => new _Third();
}

class _Third extends State<Third> {

  // TODO Declare state objects here

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
        title: Text("Third"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Third Page"),
              RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Second"); }, child: Text("Second")),
              RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Home"); }, child: Text("Back to Home")),
            ],
          ),
        ),
      ),
    );
  }

}
