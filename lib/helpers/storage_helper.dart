import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  static Future<bool> setIntVariable(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);

    return true;
  }

  static Future<bool> setDoubleVariable(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);

    return true;
  }

  static Future<bool> setStringVariable(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    return true;
  }

  static Future<bool> clearSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return true;
  }

  static Future<int?> getIntVariable(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? response = prefs.getInt(key);
    return response;
  }

  static Future<double?> getDoubleVariable(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? response = prefs.getDouble(key);
    return response;
  }

  static Future<String?> getStringVariable(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? response = prefs.getString(key);
    return response;
  }

  ////////////update shared Pref values///////////
  // Future<void> updatePref(MultiAccount model) async {
  //   await SharedPref().setStringVariable("userName", model.userName);
  //   await SharedPref()
  //       .setIntVariable("userId", int.parse(model.userId.toString()));
  //   await SharedPref().setStringVariable("userTkoen", model.userToken);
  //   await SharedPref().setStringVariable("userFullName", model.userFullName);
  //   await SharedPref()
  //       .setStringVariable("userProfileImage", model.userProfileImage ?? "");
  //   await SharedPref().setStringVariable("firstName", model.userFirstName);
  //   await SharedPref().setStringVariable("lastName", model.userLastName);
  // }
  ///////////////////////////////////////////////////////////////////////

  static Future<bool> setmodel(String key, dynamic value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, json.encode(value));
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getmodel(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? data = prefs.getString(key);
      if (data != null) {
        return json.decode(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
