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

class _State extends State<MyApp> {

  String _appBarName = "Flutter App";

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              Text("Please Login"),
              Row(
                children: <Widget>[
                  Text("Username: "),
                  //TextField(controller: _userController), // TODO -> THIS LEAD TO ERROR
                  Expanded(child: TextField(controller: _userController),) // Expanded makes the field to fill the screen width.
                ],
              ),

              Row(
                children: <Widget>[
                  Text("Password: "),
                  Expanded(child: TextField(controller: _passwordController, obscureText: true,),) // Expanded makes the field to fill the screen.
                ],
              ),

              Padding(
                padding: EdgeInsets.all(12),
                child: RaisedButton(
                  onPressed: () => print("Login ${_userController.text}"),
                  child: Text("Click me"),),
              )
              
            ],
          ),
        ),
      ),
    );
  }

}

