import 'package:flutter/material.dart';
import 'package:homeworks_01/data/auth_share_pref.dart';
import 'package:homeworks_01/routes/app_routes.dart';
import 'package:homeworks_01/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeStateScreen();
}

class _HomeStateScreen extends State<HomeScreen> {
  String? fullName = "Guest";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString(AuthSharePref.FULL_NAME);
    String? email = prefs.getString("email");

    //await Future.delayed(Duration(seconds: 2));
    setState(() {
      fullName = username ?? email ?? "Guest";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 243, 243),
      body: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(children: [_appbar(context)]),
          ],
        ),
      ),
    );
  }

  // Widget get _appbar {
  //   return Padding(
  //     padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       mainAxisSize: MainAxisSize.max,
  //       children: [
  //         SizedBox(child: Icon(Icons.menu, size: 35, color: Colors.redAccent)),
  //         Row(
  //           children: [
  //             SizedBox(
  //               child: Icon(Icons.notifications, size: 35, color: Colors.redAccent),
  //             ),
  //             SizedBox(width: 15),
  //             SizedBox(
  //               child: Icon(
  //                 Icons.account_circle_outlined,
  //                 size: 35,
  //                 color: Colors.redAccent,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _appbar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(
            child: Text(
              "Hi, ",
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            child: Text(
              "$fullName",
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, size: 30, color: Colors.redAccent),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      ],
    );
  }

  //   Widget _userName(BuildContext context) {
  //     return Padding(
  //       padding: EdgeInsets.only(top: 5, left: 30, bottom: 20),
  //       child: Column(
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 child: Text(
  //                   "Hello, ",
  //                   style: TextStyle(color: Colors.redAccent, fontSize: 20),
  //                 ),
  //               ),
  //               SizedBox(width: 10),
  //               SizedBox(
  //                 child: Text(
  //                   "$fullName",
  //                   style: TextStyle(color: Colors.redAccent, fontSize: 20),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
}
