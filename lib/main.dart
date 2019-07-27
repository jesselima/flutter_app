import 'package:flutter/material.dart';

import './screens/home.dart';
import './screens/second.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Navigation",
      routes: <String, WidgetBuilder> {
        // All available pages goes here
        "/Home": (BuildContext context) => Home(),
        "/Second": (BuildContext context) => Second(),
      },
      home: Home(), // First page to display
    );

  }
}

