import 'package:flutter/material.dart';


class MyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: <Widget>[
            Text("CLick to navigate"),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/Home");
              },
              child: Text("Click me"),
            )
          ],
        ),
      ),
    );
  }// Widget build

}
