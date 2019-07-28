import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';

void main() => runApp(
    new MaterialApp(
      home: ReplaceMe()
    )
);


class ReplaceMe extends StatefulWidget {
  @override
  _ReplaceMe createState() => new _ReplaceMe();
}

class _ReplaceMe extends State<ReplaceMe> {

  @override
  void initState() {
    super.initState();

  }

  void _onClick(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Screen Name"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("HOME"),
              RaisedButton(onPressed: _onClick, child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }

}
