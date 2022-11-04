import 'package:first_app/login_check.dart';
import 'package:first_app/super_page.dart';
import 'package:first_app/user_pages/searcher_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Apartament Tinder',
      home: LoginCheck(),
    );
  }
}
