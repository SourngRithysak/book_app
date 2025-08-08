import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/controllers/theme_controller.dart';
import 'package:homeworks_01/screens/account_screen.dart';
import 'package:homeworks_01/screens/language_screen.dart';
import 'package:homeworks_01/screens/login_screen.dart';
import 'package:homeworks_01/screens/profile_screen.dart';
import 'package:homeworks_01/screens/theme_screen.dart';
class MoreScreen extends StatefulWidget{
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _CreateStateScreen();
}

class _CreateStateScreen extends State<MoreScreen>{

  String _fullName = "Guest";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLogin = false;
  
  @override
  void initState(){
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final user = await _auth.currentUser!;
    setState(() {
      _fullName = user.email!.split("@")[0];
      _isLogin = user.email!.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          Divider(),
          ListTile(
            leading: GetBuilder<ThemeController>(
              builder: (controller) {
                return Icon(
                    controller.isLightTheme ? Icons.light_mode_outlined : Icons.dark_mode_outlined
                );
              },
            ),
            title: Text("profile".tr, style: TextStyle(fontFamily: 'Kantumruy_Pro')),
            subtitle: Text("$_fullName"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {
              _validateCurrentUser();
            },
          ),
          Divider(),
          _isLogin ? _logoutButton : Container()
        ],
      ),
    );
  }

  Widget get _logoutButton {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
          ),
          onPressed: () {
            _logout();
          },
          child: Text(
            "Logout",
            style: TextStyle(
              fontFamily: 'Kantumruy_Pro',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _validateCurrentUser() async {
    try{
      if(_isLogin){
        Get.to(AccountScreen());
      }else{
        Get.off(LoginScreen());
      }
    }catch(error){
      print("Error: $error");
    }
  }

  Future<void> _logout() async {
    try{
      await _auth.signOut();
      Get.off(LoginScreen());
    }catch (error) {
      print("Error: $error");
    }
  }

}