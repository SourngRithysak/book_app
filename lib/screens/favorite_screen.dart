import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks_01/localization/locales.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>{
  //
  // late FlutterLocalization _flutterLocalization;
  // late String _currentLocale;
  //
  // @override
  // void initState(){
  //   super.initState();
  //   _flutterLocalization = FlutterLocalization.instance;
  //   _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'favorite'.tr,
          style: TextStyle(
              fontFamily: 'Kantumruy_Pro',
              fontSize: 25,
              fontWeight: FontWeight.normal,
              color: Colors.white
          ),
        ),
        actions: [

        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Text('',
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'Kantumruy_Pro'
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // void _setLocale(String? value){
  //   if(value == null) return;
  //   if(value == 'en'){
  //     _flutterLocalization.translate("en");
  //   }else if(value == 'km'){
  //     _flutterLocalization.translate("km");
  //   }else if(value == 'zh'){
  //     _flutterLocalization.translate("zh");
  //   }else{
  //     return;
  //   }
  //   setState(() {
  //     _currentLocale = value;
  //   });
  // }
}