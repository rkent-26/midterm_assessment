import 'package:flutter/material.dart';
import 'registration_form.dart';
import 'welcome_screen.dart' show kInk;

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: kInk),
        title: const Text(
          'Create account',
          style: TextStyle(
            color: kInk,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: RegistrationForm(),
          ),
        ),
      ),
    );
  }
}