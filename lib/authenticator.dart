import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Authenticator extends StatefulWidget {
  // Uses the constructor as a callback
  Authenticator({Key key, this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() => _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {

  _AuthenticatorState({Key key, this.onAuthenticated});

  TextEditingController _user;
  TextEditingController _password;
  final ValueChanged<bool> onAuthenticated;

  void _onClicked() {
    if(_user.text != "user" || _password.text != "123456") {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    super.initState();
    _user = TextEditingController();
    _password = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                  onPressed: _onClicked,
                  child: Text("Login")
              ),
            )
          ],
        ),
      ),
    );
  }

}
