import 'package:shared_preferences/shared_preferences.dart';

import '';

class Preferences {
  void putString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<dynamic> getStringvalue(
    String key,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? value = await prefs.getString(
            key,
          ) ??
          '';
      return value;
    } catch (e) {
      return '';
    }
  }
}
