import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {

  // "build" stands for "render". In this case to render something into the screen.
  // Each widget may have its on state in memory. Remember this
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(32),
      child: Text("Hello World!"),
    );
  }

}
