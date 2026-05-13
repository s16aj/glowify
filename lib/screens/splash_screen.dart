import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const OnboardingScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF1F5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Glowify',
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
              'Your beauty, your glow.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey.shade700,
                letterSpacing: 1,
              ),
            )
                .animate()
                .fadeIn(duration: 1200.ms),
          ],
        ),
      ),
    );
  }
}