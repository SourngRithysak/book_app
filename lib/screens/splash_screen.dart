
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/account_options_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset("assets/images/Animation - 1748001832320.json")
            ,
          )
        ],
      ), 
      nextScreen: const AccountOptionsScreen(),
      splashIconSize: 700.00,
      backgroundColor: Colors.white,
      duration: 4100,
    );
  }
}