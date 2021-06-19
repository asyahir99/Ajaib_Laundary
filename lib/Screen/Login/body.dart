import 'package:ajaib_laundary/Screen/Login/background.dart';
import 'package:ajaib_laundary/Screen/Login/login.dart';
import 'package:ajaib_laundary/services/auth.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final LoginScreenState _state;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: size.height * 0.01),
        SizedBox(
          width: 350,
          child: TextField(
              decoration: InputDecoration(
                  hintText: 'e-mail',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.grey[300], width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue[300]),
                  ),
                  hintStyle: TextStyle(fontFamily: 'Futura')),
              onChanged: (value) {
                _state.email = value;
              }),
        ),
        SizedBox(height: size.height * 0.01),
        SizedBox(
          width: 350,
          child: TextField(
              obscureText: _state.showPass,
              decoration: InputDecoration(
                hintText: 'password',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.grey[300], width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue[300]),
                ),
                hintStyle: TextStyle(fontFamily: 'Futura'),
                prefixIcon: Icons.lock != null ? Icon(Icons.lock) : null,
                suffixIcon: IconButton(
                    icon: Icon(_state.showPass
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () => _state.showPass = !_state.showPass),
              ),
              onChanged: (value) {
                _state.password = value;
              }),
        ),
        SizedBox(height: size.height * 0.04),
        _state.showMessage
            ? SizedBox(height: 10.0)
            : Center(
                child: CircularProgressIndicator(),
              ),
        SizedBox(height: size.height * 0.04),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          width: 140,
          child: TextButton(
            child: Text(
              'Login',
              style: TextStyle(
                  fontFamily: 'Futura', fontSize: 20, color: Color(0xFF4BAFBE)),
            ),
            onPressed: () {
              context.read<AuthServices>().signIn(
                          email: _state.email, password: _state.password) ==
                      null
                  ? Navigator.pushNamed(context, '/list')
                  : _state.showMessage = false;
            },
          ),
        ),
        SizedBox(height: size.height * 0.1),
        Row(
          children: <Widget>[
            Text(
              'Not Registered yet? ',
              style: TextStyle(
                  fontFamily: 'Futura', fontSize: 15, color: Colors.white),
            ),
            TextButton(
              child: Text(
                'Sign up now',
                style: TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.underline),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        )
      ],
    ));
  }
}
