import 'package:flutter/material.dart';

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



  @override
  void initState() {
    super.initState();

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
              RaisedButton(onPressed: (){ Navigator.of(context).pushNamed("/Second"); }, child: Text("Next")),
            ],
          ),
        ),
      ),
    );
  }

}
