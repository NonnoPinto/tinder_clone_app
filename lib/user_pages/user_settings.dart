/* App Settings */

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final _auth = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Logged as ' + _auth.email!),
        ),
      ),
    );
  }
}
