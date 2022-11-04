/* RENTER USER MAIN PAGE 
** Here, like in Tinder, user can see searcher's cards
** Left swipe -> OK
** Right swipe -> NO
*/

import 'package:flutter/material.dart';

class RenterPage extends StatefulWidget {
  const RenterPage({Key? key}) : super(key: key);

  @override
  _RenterPageState createState() => _RenterPageState();
}

//Welcome message
Text searchWelc = const Text(
  'Stai cercando qualcuno',
  style: TextStyle(
    color: Colors.black,
  ),
);
//Backgound color
Color backGr = const Color.fromARGB(255, 223, 223, 223);

class _RenterPageState extends State<RenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('Renter_page'),
      ),
    );
  }
}
