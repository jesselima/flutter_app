import 'package:flutter/material.dart';
import 'package:flutter_app/mapservices.dart';
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
                    center: new LatLng(51.5, -0.09),
                    zoom: 13.0,
                  ),
                  layers: [
                    new TileLayerOptions(
                      urlTemplate: "https://api.tiles.mapbox.com/v4/"
                          "{id}/{z}/{x}/{y}@2x.png?access_token=${MapServices.getMapBoxAccessToken()}",
                      additionalOptions: {
                        'accessToken': MapServices.getMapBoxAccessToken(),
                        'id': 'mapbox.streets',
                      },
                    ),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 80.0,
                          height: 80.0,
                          point: new LatLng(51.5, -0.09),
                          builder: (ctx) =>
                          new Container(
                            child: new FlutterLogo(),
                          ),
                        ),
                      ],
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
