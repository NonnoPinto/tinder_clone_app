import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/user_pages/rent_settings.dart';
import 'package:first_app/user_pages/renter_page.dart';
import 'package:first_app/user_pages/search_settings.dart';
import 'package:first_app/user_pages/searcher_page.dart';
import 'package:first_app/user_pages/user_main.dart';
import 'package:first_app/user_pages/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'login_page.dart';

class SuperPage extends StatefulWidget {
  const SuperPage({Key? key}) : super(key: key);

  @override
  _SuperPageState createState() => _SuperPageState();
}

class _SuperPageState extends State<SuperPage> {
  int _selectedIndex = 1;
  //icon basic color
  final Color _iconColor = const Color.fromARGB(255, 236, 214, 145);
  //Pages list (the order correspond to index order!)
  final List<Widget> _pages = const [
    UserMain(),
    SearcherPage(),
    UserSettings(),
    RenterPage(),
    RentSettings(),
    SearchSettings()
  ];
  //Function for page landing. Ill need to choose based on user type
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //shows logout notification
  void showLogoutNotification() {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: 'Logout',
      backgroundColor: Colors.grey,
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Logout botton
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        //logout
        onPressed: () {
          showLogoutNotification();
          FirebaseAuth.instance.signOut();
        },
        backgroundColor: _iconColor,
        //Icon
        child: const Icon(
          Icons.logout_outlined,
          color: Colors.black,
        ),
      ),
      //still need to put a controller on user type
      body:
          //page
          _pages.elementAt(_selectedIndex),
      //Navigation Bar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: _iconColor,
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(Icons.home),
          Icon(Icons.search),
          Icon(Icons.settings),
        ],
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
