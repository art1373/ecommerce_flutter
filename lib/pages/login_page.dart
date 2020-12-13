import 'package:ecommrce/utils/constants.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '🎖LoginPage🎖',
          style: Constants.regularHeading,
        ),
      ),
    );
  }
}
