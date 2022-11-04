import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/login_page.dart';
import 'package:first_app/super_page.dart';
import 'package:flutter/material.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SuperPage();
          } else {
            return LoginPage();
          }
        }),
      ),
    );
  }
}
