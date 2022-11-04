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
import 'login_page.dart';

class SuperPage extends StatefulWidget {
  const SuperPage({Key? key}) : super(key: key);

  @override
  _SuperPageState createState() => _SuperPageState();
}

class _SuperPageState extends State<SuperPage> {
  int _selectedIndex = 1;
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
  void _onItemTapped(int index) {
    //Function for page landing. Ill need to choose based on user type
    setState(() {
      _selectedIndex = index;
    });
  }

  //final Color _iconColor = const Color.fromARGB(255, 236, 214, 145);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Logout botton
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(
            toastLength: Toast.LENGTH_LONG,
            msg: 'Logout',
            backgroundColor: Colors.grey,
            textColor: Colors.black,
          );
          //rn it brings back to login page
          //TO DO: logut action
          FirebaseAuth.instance.signOut();
          /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
          ); */
        },
        backgroundColor: _iconColor,
        child: const Icon(
          Icons.logout_outlined,
          color: Colors.black,
        ),
      ),
      //Landing page
      body: _pages.elementAt(_selectedIndex),
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
