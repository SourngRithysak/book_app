import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/splash_screen.dart';

void main() {
  final screens = SplashScreen();

  final app = MaterialApp(home: screens,
  debugShowCheckedModeBanner: false,);
  runApp(app);
}
