/* Search settings
** User can set preferences
** on new rooms*/

import 'package:flutter/material.dart';

class SearchSettings extends StatefulWidget {
  const SearchSettings({Key? key}) : super(key: key);

  @override
  _SearchSettingsState createState() => _SearchSettingsState();
}

class _SearchSettingsState extends State<SearchSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('search_settings'),
      ),
    );
  }
}
