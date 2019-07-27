import 'package:flutter/material.dart';

void main() => runApp(
    new MaterialApp(
      home: MyApp()
    )
);

class MyApp extends StatefulWidget {

  @override
  _State createState() => new _State();
}


class _Painter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    // All the work should be done here

    final radius = 100.0;
    final Offset offset = Offset(0.0, 75.0);

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue.shade500
      ..style = PaintingStyle.stroke;

    final Offset bodyStart = Offset(0.0, 50.0);
    final Offset bodyEnd = Offset(0.0, 0.0);

    // Action!!!
    canvas.drawCircle(offset, radius, paint);
    canvas.drawLine(bodyStart, bodyEnd, paint);

    // ###########################

    final Rect rect = Rect.fromCircle(center: offset, radius: radius);
    final Paint rectPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.orange.shade500
      ..style = PaintingStyle.stroke;

    canvas.drawRect(rect, rectPaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
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
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[


              /**
               * TODO Info -> THE ORDER IS VERY IMPORTANT - FIRST CODE SAY IN DEEPER LAYERS
               */

              CustomPaint(painter: _Painter()),

              Text(_appBarName, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      ),
    );
  }

}
