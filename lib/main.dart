import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _showUrl() {
    _launch("https://flutter.dev/");
  }

  void _showEmail() {
    _launch("mailto:jesselima.tech@gmail.com");
  }

  void _showSms() {
    _launch("sms:11981111566");
  }

  void _showTelephone() {
    _launch("tel:11981111566");
  }

  void _launch(String urlString) async {
    if(await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw "Could not launch url.";
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              RaisedButton(onPressed: _showUrl,       child: Text("URL")),
              RaisedButton(onPressed: _showEmail,     child: Text("Email")),
              RaisedButton(onPressed: _showSms,       child: Text("SMS")),
              RaisedButton(onPressed: _showTelephone, child: Text("Telephone")),

            ],
          ),
        ),
      ),
    );
  }

}
