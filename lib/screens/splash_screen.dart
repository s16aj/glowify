import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_theme.dart';
import 'main_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Show the splash screen for 3 seconds, then check if the user is logged in.
    Timer(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppTheme.background(isDark),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'app_name'.tr(),
              style: AppTheme.titleStyle(fontSize: 52, letterSpacing: 2),
            ).animate().fadeIn(duration: 900.ms).slideY(begin: 0.3, end: 0),

            const SizedBox(height: 16),

            Text(
              'tagline'.tr(),
              style: AppTheme.bodyStyle(
                isDark: isDark,
                fontSize: 16,
                letterSpacing: 1,
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
              ),
            ).animate().fadeIn(duration: 1200.ms),
          ],
        ),
      ),
    );
  }
}
