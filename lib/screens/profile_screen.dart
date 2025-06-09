import 'package:flutter/material.dart';
import 'package:homeworks_01/data/auth_share_pref.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileStateScreen();
}

class _ProfileStateScreen extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // width: MediaQuery.of(context).size.width,
          width: 300,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen(),
                ),
                ModalRoute.withName('/'),
              );

              // AuthSharePref.logout();
            },
            child: Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
