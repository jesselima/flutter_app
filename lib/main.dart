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

  int _counter = 0;
  List<Widget> _list = List<Widget>();


  @override
  void initState() {
      for(int i = 0; i < 5; i++) {
        Widget _child = _newItem(i);
        _list.add(_child);
      }
  }


  // TODO Info -> CLICK ACTION
  void _onClicked() {
    Widget child = _newItem(_counter);
    setState(() {
      _list.add(child);
    });
  }

  // TODO Info -> NEW ITEM
  Widget _newItem(int i) {

    Key key = Key("item_$i"); // When we call this key, we will be referencing the Container key

    Container child = Container(
      key: key,
      padding: EdgeInsets.all(10),
      child: Chip(
        label: Text("$i Name Here"),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "Delete",
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),
      ),
    );
    _counter++;
    return child;
  }


  // TODO Info ->  REMOVE ITEM
  void _removeItem(Key key) {
    for(int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if(child.key == key) {
        setState(() {
          _list.removeAt(i);
          print("Removing ${key.toString()}");
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Title Text"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: Icon(Icons.add),
      ),

      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: _list,
          ),
        ),
      ),
    );
  }

}
