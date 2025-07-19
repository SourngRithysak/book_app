import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/controllers/theme_controller.dart';

class ThemeScreen extends StatefulWidget{
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen>{

  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("theme".tr, style: TextStyle(
                fontFamily: 'Kantumruy_Pro',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
            centerTitle: true,
            backgroundColor: Colors.redAccent,
            elevation: 0.5,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.light_mode_outlined),
                title: Text("lightTheme".tr, style: TextStyle(fontFamily: 'Kantumruy_Pro'),),
                trailing: Checkbox(value: controller.isLightTheme, onChanged: (val) {
                  controller.toggleTheme(true);
                }),
                onTap: () => controller.toggleTheme(true),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.dark_mode_outlined),
                title: Text("darkTheme".tr, style: TextStyle(fontFamily: 'Kantumruy_Pro'),),
                trailing: Checkbox(value: !controller.isLightTheme, onChanged: (val) {
                  controller.toggleTheme(false);
                }),
                onTap: () => controller.toggleTheme(false),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}