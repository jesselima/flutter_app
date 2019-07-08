import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Map _countries = new Map();

  void _getRemoteData() async {
    var url = "http://country.io/names.json";
    var response = await http.get(url);
    if(response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
      print("Loaded... ${_countries.length} countries.");
    }
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

              Text("Countries",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return Row(
                      children: <Widget>[
                        Text('$key'),
                        Text('${_countries[key]}')
                      ],
                    );
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  // TODO -> Important to make the net work call here.
  // ...If you make call inside the builder, there will too much no needed calls.
  @override
  void initState() {
    _getRemoteData();
  }

}

