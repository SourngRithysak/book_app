import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/controllers/theme_controller.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/translate/Message.dart';
import 'package:http/http.dart';

import 'localization/locales.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // option 1
      // home: screens,

      // option 2
      // routes: {

      // }
      // option 3
      initialRoute: AppRoutes.animationSplashScreen,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      navigatorKey: AppRoutes.key,

      // translate
      translations: Message(),
      locale: Get.deviceLocale,

      // theme
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeController.theme,

      debugShowCheckedModeBanner: false,
    );
  }
}

