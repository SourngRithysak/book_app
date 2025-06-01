import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/account_options_screen.dart';
import 'package:homeworks_01/screens/account_registration.dart';
import 'package:homeworks_01/screens/login_screen.dart';
import 'package:homeworks_01/screens/main_screen.dart';
import 'package:homeworks_01/screens/splash_screen.dart';
class AppRoutes {
  static const animationSplashScreen = "";
  static const accountOptionsScreen = "/accountOptionsScreen";
  static const loginScreen = "/loginScreen";
  static const accountRegistration = "/accountRegistrationScreen";
  static const mainScreen = "/mainScreen";

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case animationSplashScreen:
        return _buildRoute(routeSettings, SplashScreen());
      case accountOptionsScreen:
        return _buildRoute(routeSettings, AccountOptionsScreen());
      case loginScreen:
        return _buildRoute(routeSettings, LoginScreen()); 
      case accountRegistration:
        return _buildRoute(routeSettings, AccountRegistration());    
      case mainScreen:
        return _buildRoute(routeSettings, MainScreen()); 
      default:
        throw RouteException("Route not found!");
    }
  }

  static Route<dynamic> _buildRoute(RouteSettings routeSettings, Widget newScreen){
    return MaterialPageRoute(settings:  routeSettings, builder: (context) => newScreen); 
  }
}

class RouteException implements Exception {

  String message;

  RouteException(this.message);

}
