// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class AuthSharePref {

  static const String FULL_NAME = "fullName";


  static Future<void> login(String email, String password) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  static Future<void> register(String fullname, String username, String email, String password) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(FULL_NAME, fullname);
    await prefs.setString("username", username);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  static Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}