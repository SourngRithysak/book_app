import 'package:flutter/material.dart';
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Kantumruy_Pro',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal
            ),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ApiConnected(),
          _switchLanguageBtn,
          _logout(context)
        ],
      )
    );
  }

  Widget get _switchLanguageBtn{
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: DropdownButton<String>(
            dropdownColor: Colors.white,
            icon: const Icon(Icons.language, color: Colors.black,),
            underline: Container(),
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Row(
                  children: [
                    Icon(Icons.flag, color: Colors.blueAccent, size: 18,),
                    SizedBox(width: 8,),
                    Text(
                        'English'
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'km',
                child: Row(
                  children: [
                    Icon(Icons.flag, color: Colors.redAccent, size: 18),
                    SizedBox(width: 8),
                    Text('Khmer'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'zh',
                child: Row(
                  children: [
                    Icon(Icons.flag, color: Colors.orangeAccent, size: 18),
                    SizedBox(width: 8),
                    Text('Chinese'),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
            }
        ),
      ),
    );
  }

  Widget _logout(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          ),
          onPressed: (){
            AppRoutes.key.currentState?.pushReplacementNamed(AppRoutes.accountOptionsScreen);
            AuthSharePref.logout();
          },
          child: Text(
            'Logout'
          )),
      ),
    );
  }
}
