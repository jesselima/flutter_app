import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: Second()
    )
);

// TODO declare final global objects here

class Second extends StatefulWidget {
  @override
  _Second createState() => new _Second();
}

class _Second extends State<Second> {

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
        title: Text("Second"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Second Page"),
            RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Third"); }, child: Text("Next")),
            RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Home"); }, child: Text("Back")),
            ],
          ),
        ),
      ),
    );
  }

}
