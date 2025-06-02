import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeStateScreen();
}

class _HomeStateScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 191, 191),
      body: Expanded(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(children: [_header, _userName(context)]),
          ],
        ),
      ),
    );
  }

  Widget get _header {
    return Padding(
      padding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(child: Icon(Icons.menu, size: 35, color: Colors.grey)),
          Row(
            children: [
              SizedBox(
                child: Icon(Icons.notifications, size: 35, color: Colors.grey),
              ),
              SizedBox(width: 15),
              SizedBox(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _userName(BuildContext context) {
    final String username =
        ModalRoute.of(context)!.settings.arguments as String;
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 30, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  "Hello, ",
                  style: TextStyle(color: Colors.redAccent, fontSize: 20),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                child: Text(
                  "$username!",
                  style: TextStyle(color: Colors.redAccent, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
