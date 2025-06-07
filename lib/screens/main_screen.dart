import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:homeworks_01/screens/favorite_screen.dart';
import 'package:homeworks_01/screens/home_screen.dart';
import 'package:homeworks_01/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainStateScreen();
}

class _MainStateScreen extends State<MainScreen> {
  int _currentIndex = 0;

  final screenLists = [HomeScreen(), FavoriteScreen() , HomeScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    final navigationBar = [
      const Icon(Icons.home, color: Colors.redAccent),
      const Icon(Icons.notifications, color: Colors.redAccent),
      const Icon(Icons.favorite, color: Colors.redAccent),
      const Icon(Icons.person, color: Colors.redAccent),
    ];

    final navbar = CurvedNavigationBar(
      items: navigationBar,
      backgroundColor: Colors.redAccent,
      color: Colors.white,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      animationDuration: Duration(milliseconds: 300),
    );

    final screen = Scaffold(
      backgroundColor: Colors.redAccent,
      body: screenLists.elementAt(_currentIndex),
      bottomNavigationBar: navbar,
    );

    return screen;
  }
}
