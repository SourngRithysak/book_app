import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset("assets/images/facebook_logo.png", width: 70),
          ),
          SizedBox(
            child: Image.asset("assets/images/google_logo.png", width: 35),
          ),
        ],
      ),
    );
  }
}
