import 'package:flutter/material.dart';
import 'welcome_screen.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YourApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: kViolet,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}