import 'package:flutter/material.dart';

import 'package:user_settings/src/pages/settings_page.dart';
import 'package:user_settings/src/pages/home_page.dart';
import 'package:user_settings/src/share_preferences/preferences.dart';

final _prefs = UserPreferences();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferences',
      initialRoute: _prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
