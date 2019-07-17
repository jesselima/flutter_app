import 'dart:core';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: MyApp()
    )
);

// TODO declare final global objects or classes here

class Sales {
  String year;
  int sales;

  Sales({this.year, this.sales});
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  // TODO Declare state objects here
  List<Sales> _data;
  List<charts.Series<Sales, String>> _chartData;

  void _makeData() {
    _data = List<Sales>();
    _chartData = List<charts.Series<Sales, String>>();

    Random rdn = Random();
    // Generates a randomData
    for(int i = 2010; i < 2019; i++) {
      _data.add(Sales(year: i.toString(), sales: rdn.nextInt(1000)));
    }

    _chartData.add(charts.Series(
        id: "Sales",
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: _data,
        domainFn: (Sales sales, __) => sales.year,
        measureFn: (Sales sales, __) => sales.sales,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      displayName: "Sales"
    ));
  }

  @override
  void initState() {
    super.initState();
    _makeData();

  }

  String _appBarName = "Flutter App";
  String _someTextValue = "Hello World!";

  void _onClick(){
    setState(() {
      _someTextValue = "Text clicked and state changed";
    });
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
              Text("Sales Data"),
              Expanded(
                child: new charts.BarChart(_chartData),
              )
            ],
          ),
        ),
      ),
    );
  }

}
