import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/controllers/theme_controller.dart';
import 'package:homeworks_01/screens/language_screen.dart';
import 'package:homeworks_01/screens/theme_screen.dart';
class MoreScreen extends StatefulWidget{
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _CreateStateScreen();
}

class _CreateStateScreen extends State<MoreScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("more".tr,
          style: TextStyle(
              fontFamily: 'Kantumruy_Pro',
              fontSize: 25,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language),
            title: Text("titleLang".tr, style: TextStyle(fontFamily: 'Kantumruy_Pro'),),
            subtitle: Text("subLang".tr, style: TextStyle(fontFamily: 'Kantumruy_Pro')),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: (){
              Get.to(LanguageScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: GetBuilder<ThemeController>(
              builder: (controller) {
                return Icon(
                  controller.isLightTheme ? Icons.light_mode_outlined : Icons.dark_mode_outlined
                );
              },
            ),
            title: Text("theme".tr, style: TextStyle(fontFamily: 'Kantumruy_Pro')),
            subtitle: GetBuilder<ThemeController>(
              builder: (controller) {
                return Text(controller.isLightTheme ? "lightTheme".tr : "darkTheme".tr,
                    style: TextStyle(
                        fontFamily: 'Kantumruy_Pro'
                    )
                );
              },
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              Get.to(ThemeScreen());
            },
          ),
          Divider()
        ],
      ),
    );
  }
}