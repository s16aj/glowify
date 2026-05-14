import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF1F5),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xffFFF1F5),
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}