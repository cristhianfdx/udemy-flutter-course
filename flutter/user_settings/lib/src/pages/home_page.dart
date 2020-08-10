import 'package:flutter/material.dart';

import 'package:user_settings/src/share_preferences/preferences.dart';
import 'package:user_settings/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final _prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    _prefs.lastPage = HomePage.routeName;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: _prefs.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Secondary color: ${_prefs.secondaryColor}'),
          Divider(),
          Text("Genre: ${_prefs.genre == 1 ? 'Female' : 'Male'}"),
          Divider(),
          Text('Username: ${_prefs.name}'),
          Divider()
        ],
      ),
    );
  }
}
