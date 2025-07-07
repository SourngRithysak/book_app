// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:homeworks_01/responsive/desktop_body.dart';
import 'package:homeworks_01/responsive/mobile_body.dart';
import 'package:homeworks_01/responsive/responsive_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeStateScreen();
}

class _HomeStateScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileBody: MobileBody(), desktopBody: DesktopBody());
  }
}
