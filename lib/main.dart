import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  MapController mapController;
  Map<String, LatLng> coordinates;
  List<Marker> markers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mapController = MapController();

    coordinates = Map<String, LatLng>();
    coordinates.putIfAbsent("Jhon",     () => LatLng(41.8781, -87.6298));
    coordinates.putIfAbsent("Bill",     () => LatLng(42.3314, -83.0458));
    coordinates.putIfAbsent("Petter",   () => LatLng(42.7325, -84.5555));

    markers = List<Marker>();

    for (int i = 0; i < coordinates.length; i++) {
      markers.add(
          Marker(
              width: 80.0,
              height: 80.0,
              point: coordinates.values.elementAt(i),
              builder: (ctx) => Icon(Icons.pin_drop, color: Colors.red))
      );
    }
  }

  // Method to move the map around...
  void _showCoordinates(int index) {
    mapController.move(coordinates.values.elementAt(index), 8.0);
  }

  List<Widget> _makeButtons() {
    List<Widget> list = List<Widget>();
    for(int i = 0; i < coordinates.length; i++) {
      list.add(
          Padding(
            padding: EdgeInsets.all(5),
            child: FlatButton(
              onPressed: () => _showCoordinates(i),
              child: Text(coordinates.keys.elementAt(i)),
              color: Colors.black12,
          ))

      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(_appBarName),
      ),
      body: Container(
        //padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[

              Row(
                children: _makeButtons(),
              ),

              Flexible(
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: LatLng(41.8781, -87.6298),
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