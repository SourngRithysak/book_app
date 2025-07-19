import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{

  bool isLightTheme = true;

  ThemeMode get theme => isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme(bool isLight) {
    isLightTheme = isLight;
    Get.changeThemeMode(theme);
    update();
  }

}