import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';

// This implementation here is important for launch request permission when the App launches.
Permission permissionFromString(String value){
  Permission permission;
  for (var item in Permission.values) {
    if(item.toString() == value) {
      permission = item;
      break;
    }
  }
  return permission;
}


void main() async {

  await SimplePermissions.requestPermission(permissionFromString("Permission.ReadContacts"));
  await SimplePermissions.requestPermission(permissionFromString("Permission.WriteContacts"));

  runApp(MaterialApp(
          home: MyApp()
      )
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

  }


  void _create() async {

    Contact contact = Contact(
      familyName: "Lima",
      givenName: "Jesse",
      emails: [
        Item(
          label: "Work",
          value: "jesselima.tech@gmail.com"
        ),
      ]
    );

    await ContactsService.addContact(contact);
    showSnackBar("Contac created!");
  }

  void _find() async {
    Iterable<Contact> people = await ContactsService.getContacts(query: "Jesse");
    showSnackBar("There are ${people.length} people name Jesse");
  }

  void _read() async {
    Iterable<Contact> people = await ContactsService.getContacts(query: "Jesse");
    Contact contact = people.first;
    showSnackBar("Jesse email is ${contact.emails.first.value}");
  }

  void _delete() async {
    Iterable<Contact> people = await ContactsService.getContacts(query: "Jesse");
    Contact contact = people.first;
    
    await ContactsService.deleteContact(contact);
    showSnackBar("Contact ${contact.displayName} deleted.");

  }

  void showSnackBar(String message) {
      _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(message),));
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Screen Name"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("HOME"),
              RaisedButton(onPressed: _create, child: Text("Create")),
              RaisedButton(onPressed: _find, child: Text("Find")),
              RaisedButton(onPressed: _read, child: Text("Read")),
              RaisedButton(onPressed: _delete, child: Text("Delete")),
              RaisedButton(onPressed: () => SimplePermissions.openSettings(), child: Text("Settings")),
            ],
          ),
        ),
      ),
    );
  }

}
