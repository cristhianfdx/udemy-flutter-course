import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_settings/src/pages/home_page.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._();
  SharedPreferences _prefs;

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._();

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  int get genre {
    return this._prefs.getInt('genre') ?? 1;
  }

  set genre(int value) {
    this._prefs.setInt('genre', value);
  }

  bool get secondaryColor {
    return this._prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    this._prefs.setBool('secondaryColor', value);
  }

  String get name {
    return this._prefs.getString('name') ?? '';
  }

  set name(String name) {
    this._prefs.setString('name', name);
  }

  String get lastPage {
    return this._prefs.getString('lastPage') ?? HomePage.routeName;
  }

  set lastPage(String lastPage) {
    this._prefs.setString('lastPage', lastPage);
  }
}
