import 'package:ecommrce/pages/Home_page.dart';
import 'package:ecommrce/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Landing extends StatelessWidget {
  final Future<FirebaseApp> _initFB = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFB,
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error, ${snapShot.error}'),
            ),
          );
        }
        if (snapShot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapShot) {
              if (streamSnapShot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text('Error, ${streamSnapShot.error}'),
                  ),
                );
              }
              if (streamSnapShot.connectionState == ConnectionState.active) {
                User user = streamSnapShot.data;
                if (user == null) {
                  return Login();
                } else {
                  return Home();
                }
              }
              return Scaffold(
                body: Center(
                  child: Text('Checking Auth...'),
                ),
              );
            },
          );
        }
      },
    );
  }
}
