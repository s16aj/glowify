import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xffFFF1F5),

      pages: [
        PageViewModel(
          title: 'Welcome to Glowify',
          body: 'Discover luxury beauty and skincare products.',
          image: Center(
            child: Image.asset(
              'assets/images/onboarding1.png',
              width: 300,
            ),
          ),
        ),

        PageViewModel(
          title: 'Glow Every Day',
          body: 'Find makeup and skincare that fits your style.',
          image: Center(
            child: Image.asset(
              'assets/images/onboarding2.png',
              width: 250,
            ),
          ),
        ),

        PageViewModel(
          title: 'Beauty Made Simple',
          body: 'Shop your favorite beauty products easily.',
          image: Center(
            child: Image.asset(
              'assets/images/onboarding3.png',
              width: 250,
            ),
          ),
        ),
      ],

      showSkipButton: true,

      skip: const Text(
        'Skip',
        style: TextStyle(
          color: Colors.black,
        ),
      ),

      next: const Icon(
        Icons.arrow_forward,
        color: Colors.pink,
      ),

      done: const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),

      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      },
    );
  }
}