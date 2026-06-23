import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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

    // Show splash for 3 seconds, then check if the user is logged in.
    Timer(
      const Duration(seconds: 3),
      () {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'app_name'.tr(),
              style: GoogleFonts.playfairDisplay(
                fontSize: 52,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade300,
                letterSpacing: 2,
              ),
            )
                .animate()
                .fadeIn(duration: 900.ms)
                .slideY(begin: 0.3, end: 0),
            const SizedBox(height: 16),
            Text(
              'tagline'.tr(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                letterSpacing: 1,
              ),
            ).animate().fadeIn(duration: 1200.ms),
          ],
        ),
      ),
    );
  }
}