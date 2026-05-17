import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.playfairDisplay(
        color: isDark ? Colors.white : Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: GoogleFonts.playfairDisplay(
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
        fontSize: 16,
      ),
      imagePadding: const EdgeInsets.only(top: 60),
      pageColor: isDark ? Colors.black : const Color(0xffFFF1F5),
    );

    return IntroductionScreen(
      globalBackgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
      pages: [
        PageViewModel(
          title: 'welcome_title'.tr(),
          body: 'welcome_body'.tr(),
          decoration: pageDecoration,
          image: Center(
            child: SvgPicture.asset(
              'assets/images/onboarding1.svg',
              width: 300,
            ),
          ),
        ),
        PageViewModel(
          title: 'glow_title'.tr(),
          body: 'glow_body'.tr(),
          decoration: pageDecoration,
          image: Center(
            child: SvgPicture.asset(
              'assets/images/onboarding2.svg',
              width: 250,
            ),
          ),
        ),
        PageViewModel(
          title: 'simple_title'.tr(),
          body: 'simple_body'.tr(),
          decoration: pageDecoration,
          image: Center(
            child: SvgPicture.asset(
              'assets/images/onboarding3.svg',
              width: 250,
            ),
          ),
        ),
      ],
      showSkipButton: true,
      skip: Text(
        'skip'.tr(),
        style: GoogleFonts.playfairDisplay(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      next: const Icon(Icons.arrow_forward, color: Colors.pink),
      done: Text(
        'done'.tr(),
        style: GoogleFonts.playfairDisplay(
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      },
    );
  }
}
