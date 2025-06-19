import 'package:flutter/material.dart';
import 'package:homeworks_01/routes/app_routes.dart';
// import 'package:homeworks_01/screens/splash_screen.dart';

void main() {

  // final screens = SplashScreen();

  final app = MaterialApp(
    // option 1
    // home: screens,

    // option 2
    // routes: {

    // },

    // option 3
    initialRoute: AppRoutes.animationSplashScreen,
    onGenerateRoute: AppRoutes.onGenerateRoute,
    navigatorKey: AppRoutes.key,

  debugShowCheckedModeBanner: false,);
  runApp(app);
}