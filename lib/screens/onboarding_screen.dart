import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../theme/app_theme.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: AppTheme.titleStyle(
        fontSize: 28,
        color: AppTheme.textColor(isDark),
      ),
      bodyTextStyle: AppTheme.bodyStyle(
        isDark: isDark,
        fontSize: 16,
        color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
      ),
      imagePadding: const EdgeInsets.only(top: 60),
      pageColor: AppTheme.background(isDark),
    );

    return IntroductionScreen(
      globalBackgroundColor: AppTheme.background(isDark),
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
      skip: Text('skip'.tr(), style: AppTheme.bodyStyle(isDark: isDark)),
      next: const Icon(Icons.arrow_forward, color: Colors.pink),
      done: Text(
        'done'.tr(),
        style: AppTheme.bodyStyle(
          isDark: isDark,
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
