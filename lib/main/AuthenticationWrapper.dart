import 'package:ajaib_laundary/Screen/Laundry/List/list.dart';
import 'package:ajaib_laundary/Screen/Login/login.dart';
import 'package:ajaib_laundary/Screen/register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      return ListScreen();
    }
    return LoginScreen();
  }
}
