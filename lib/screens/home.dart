import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: Home()
    )
);

// TODO declare final global objects here

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {

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
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Home Page"),
              RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Second"); }, child: Text("Next") )
            ],
          ),
        ),
      ),
    );
  }

}
