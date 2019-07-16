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

  double _value = 0.0;

  void _onChanged(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Title Text"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[

              Text(_value.toString()),

              Slider(
               value: _value,
               onChanged: _onChanged,
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: LinearProgressIndicator(
                  value: _value,
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: LinearProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  value: _value,
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: RefreshProgressIndicator(
                  value: _value,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
