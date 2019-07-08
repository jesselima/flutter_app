import 'dart:async';

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

  // BottomNavigationBar objects and setup. See also bottomNavigationBar at the Scaffold
  List<BottomNavigationBarItem> _items;
  int _index = 0;

  @override
  void initState() {
    _items = List();
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        title: Text("Profile")));
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.security),
        title: Text("Security")));
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.message),
        title: Text("Messages")));
  }

  // AppBar and Clock (DateTime) Actions
  int _value = 0;
  String dateView = "";
  String bottomNavPositionText = "";

  void _add() =>  setState(() =>  _value++);
  void _remove() => setState(() => _value--);
  void _onClick() => setState(() => dateView = DateTime.now().toString());

  // Bottom Sheet
  void _showBottom() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Add Widgets Here!  ",
                  style: TextStyle(color: Colors.red,
                    fontWeight: FontWeight.bold
                  ),
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                )
              ],
            ),
          );
        }
    );
  }

  // SnackBar
  // Any control has a "key" property. (press Alt + Enter to see it). Container, AppBar, and so on.
  // What is a key? Is a way to reference the _scaffoldState inside a Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // SnackBar
  void _showSnackBar() {
    //  _scaffoldState.currentState access the current ScaffoldState.
    //  ... In this case The "return new Scaffold(...
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text("Want a snack?")));
  }

  // AlertDialog
  Future _showDialog(BuildContext context, String message) {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(message),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK")
            ),

          ],
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    // build refer to "render". To render something into the screen.
    return new Scaffold(

      // Reference to GlobalKey<ScaffoldState> from the top. This key object allows us
      //...to access the state of this Scaffold from outside. In this case
      // ... from the _showSnackBar function
      key: _scaffoldState,

      appBar: AppBar(
        title: Text(_appBarName),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _add),
          IconButton(icon: Icon(Icons.remove), onPressed: _remove)
        ],
      ),

      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Text("App Drawer"),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: _onClick,
        backgroundColor: Colors.red,
        mini: true,
        child: Icon(Icons.timer),
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37
                ),
              ),
              Text(dateView),
              Text(bottomNavPositionText),
              RaisedButton(onPressed: _showBottom, child: Text("Open BottomSheet"),),
              RaisedButton(onPressed: _showSnackBar, child: Text("Show Snack"),),
              RaisedButton(onPressed: () =>_showDialog(context, "Add Widgets Here"), child: Text("Show Dialog"),)
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          setState(() {
            _index = item;
            bottomNavPositionText = "Current Botom Nav Pos is: ${_index.toString()}";
          });
        },

      ),

    );
  }

}

