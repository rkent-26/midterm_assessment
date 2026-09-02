import 'package:flutter/material.dart';
import 'welcome_screen.dart';

// StatelessWidget: root of the app, doesn't hold changing data
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: UI/Theming team plugs in ThemeData(...) here
      title: 'Registration App',
      home: const WelcomeScreen(),
    );
  }
}
