import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';

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

  String status;
  Permission permission;
  Permission permissionLog;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = "Select a item";
    print(permissionLog.toString());
  }


  requestPermission() async {
    final res = await SimplePermissions.requestPermission(permission);
    print("permission request result is " + res.toString());
    setState(() {
      status = '${permission.toString()} = ${res.toString()} ';
    });
  }

  checkPermission() async {
    bool res = await SimplePermissions.checkPermission(permission);
    print("permission is " + res.toString());
    setState(() {
      status = '${permission.toString()} = ${res.toString()} ';
    });
  }

  getPermissionStatus() async {
    final res = await SimplePermissions.getPermissionStatus(permission);
    print("permission status is " + res.toString());
    setState(() {
      status = '${permission.toString()} = ${res.toString()} ';
    });
  }

  onDropDownChanged(Permission permission) {
    setState(() {
      this.permission = permission;
      status = "Select a button below";
    });
  }

  List<DropdownMenuItem<Permission>> _getDropDownItems() {

    List<DropdownMenuItem<Permission>> items = List<DropdownMenuItem<Permission>>();
    Permission.values.forEach((permission) {
      var item = DropdownMenuItem(
                          child: Text(getPermissionString(permission)),
                          value: permission);
      items.add(item);
    });
    return items;
  }

  // ############## BUILD SCREEN ##############

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

              Text(status),

              DropdownButton(
                items: _getDropDownItems(),
                value: permission,
                onChanged: onDropDownChanged,
              ),

              RaisedButton(onPressed: checkPermission, child: Text("Check Permission"),),
              RaisedButton(onPressed: requestPermission, child: Text("Request Permission"),),
              RaisedButton(onPressed: getPermissionStatus, child: Text("Get Status"),),
              RaisedButton(onPressed: () async => SimplePermissions.openSettings(), child: Text("Open Settings"),)


            ],
          ),
        ),
      ),
    );
  }

}
