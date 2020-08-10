import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:user_settings/src/share_preferences/preferences.dart';
import 'package:user_settings/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genre;

  TextEditingController _textEditingController;
  final _prefs = UserPreferences();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: _prefs.name);
    _genre = _prefs.genre;
    _secondaryColor = _prefs.secondaryColor;
    _prefs.lastPage = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preferences'),
          backgroundColor: _secondaryColor ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _secondaryColor,
              title: Text('Secondary color'),
              onChanged: (value) {
                setState(() {
                  _secondaryColor = value;
                  _prefs.secondaryColor = value;
                });
              },
            ),
            Divider(),
            RadioListTile(
                value: 1,
                title: Text('Male'),
                groupValue: _genre,
                onChanged: (value) {
                  _setSelectedRadio(value);
                }),
            RadioListTile(
                value: 2,
                title: Text('Female'),
                groupValue: _genre,
                onChanged: (value) {
                  _setSelectedRadio(value);
                }),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  _prefs.name = value;
                },
              ),
            )
          ],
        ));
  }

  void _setSelectedRadio(int value) {
    setState(() {
      _genre = value;
      _prefs.genre = value;
    });
  }
}
