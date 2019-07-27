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

class _State extends State<MyApp> {

  String _appBarName = "Flutter App";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[

              Text(_appBarName),

              Container(
                width: 300,
                height: 300,
                child: Center(child: Text("Hello World!"),),
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange, width: 2.0),
                  gradient: RadialGradient(colors: <Color>[Colors.red, Colors.yellow])
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
