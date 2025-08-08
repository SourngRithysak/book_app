import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/custom/custom_dropdown.dart';
import 'package:homeworks_01/data/auth_share_pref.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/screens/api/api_connected.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileStateScreen();
}

class _ProfileStateScreen extends State<ProfileScreen> {


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'profile'.tr,
          style: TextStyle(
              fontFamily: 'Kantumruy_Pro',
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.normal
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
        ],
      )
    );
  }
}
