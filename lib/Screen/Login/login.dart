import 'package:flutter/material.dart';
import 'body.dart';

class LoginScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => LoginScreen());
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  bool _showPass = true, _showMessage = true;

  get email => _email;
  set email(value) => setState(() => _email = value);

  get password => _password;
  set password(value) => setState(() => _password = value);

  get showPass => _showPass;
  set showPass(value) => setState(() => _showPass = value);

  get showMessage => _showMessage;
  set showMessage(value) => setState(() => _showMessage = value);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Body(
        state: this,
      ),
    ));
  }
}
