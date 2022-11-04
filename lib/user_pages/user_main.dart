/* Support page for toolbar */

import 'package:flutter/material.dart';

class UserMain extends StatefulWidget {
  const UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('user_main'),
      ),
      /* bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 207, 204, 204),
        animationDuration: const Duration(milliseconds: 300),
        items: [
          IconButton(
            onPressed: () {
              const SearcherPage();
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserMain(),
                ),
              ); */
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserMain(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserMain(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ), */
    );
  }
}
