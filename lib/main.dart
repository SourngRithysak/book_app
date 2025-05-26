import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/account_options_screen.dart';
// import 'package:homeworks_01/screens/splash_screen.dart';

void main() {

  final screens = AccountOptionsScreen();

  final app = MaterialApp(home: screens,
  debugShowCheckedModeBanner: false,);
  runApp(app);
}
