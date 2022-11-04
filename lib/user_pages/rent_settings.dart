/* Search settings
** User can set preferences
** on new occupants*/

import 'package:flutter/material.dart';

class RentSettings extends StatefulWidget {
  const RentSettings({Key? key}) : super(key: key);

  @override
  _RentSettingsState createState() => _RentSettingsState();
}

class _RentSettingsState extends State<RentSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('rent_settings'),
    );
  }
}
