import 'package:flutter/material.dart';
import 'package:flutter_app/timecounter.dart';
import 'dart:async';

import 'package:flutter_app/timedisplay.dart';

void main() => runApp(
    new MaterialApp(
      home: TimeCounter()
    )
);


class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => new _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {

  Stopwatch _watch;
  Timer _timer;
  Duration _duration;


  @override
  void initState() {
    super.initState();
    _duration = Duration();
  }

  void _onStart(){
    setState(() {
      _watch = Stopwatch();
      _timer = Timer.periodic(Duration(microseconds: 250), _onTimeout);
    });
    _watch.start();
  }

  void _onStop(){
    setState(() {
      _watch.stop();
      _timer.cancel();
    });
  }

  void _onTimeout(Timer timer){
    if(!_watch.isRunning) return;
    setState(() => _duration = _watch.elapsed);
  }

  void _onClear(Duration value){
    setState(() => _duration = Duration());
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: <Widget>[
            TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: _onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: _onStart,
                    child: Text("Start"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: _onStop,
                    child: Text("Stop"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
