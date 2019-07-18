import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(
    new MaterialApp(
      home: Clock()
    )
);

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => new _ClockState();
}

class _ClockState extends State<Clock> {

  String _value = "Time Here";
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    var now = DateTime.now();
    var formatter = new DateFormat("hh:mm:ss"); // DateFormat is not been called by auto complete :/
    String formattedValue = formatter.format(now);

    setState(() => _value = formattedValue);
  }

  @override
  Widget build(BuildContext context) {

    return Text(
      _value,
      style:
      TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold
      ),
    );
  }

}
