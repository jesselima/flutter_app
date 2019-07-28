import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

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

    var markers = <Marker>[
      Marker(
        width: 80.0,
        height: 80.0,
        point: new LatLng(41.8781, -87.6298),
        builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)),

      Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(42.3314, -83.0458),
          builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)),

      Marker(
          width: 80.0,
          height: 80.0,
          point: new LatLng(42.7325, -84.5555),
          builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red)),

    ];

    return new Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[

              // MapServices.getMapBoxAccessToken()
              Flexible(
                child: FlutterMap(
                  options: new MapOptions(
                    center: new LatLng(41.8781, -87.6298),
                    zoom: 13.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']
                    ),
                    MarkerLayerOptions(
                      markers: markers,
                    ),
                  ],
                )
              )

            ],
          ),
        ),
      ),
    );
  }

}
