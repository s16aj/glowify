import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../theme/app_theme.dart';
import '../services/auth_service.dart';
import '../widgets/primary_button.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;

    final logoutText = context.locale.languageCode == 'ar'
        ? 'تسجيل الخروج'
        : 'Log Out';

    return Scaffold(
      backgroundColor: AppTheme.background(themeIsDark),
      appBar: AppBar(
        title: Text(
          'settings'.tr(),
          style: TextStyle(color: AppTheme.textColor(themeIsDark)),
        ),
        backgroundColor: AppTheme.background(themeIsDark),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Switch between light mode and dark mode.
            SwitchListTile(
              title: Text(
                'dark_mode'.tr(),
                style: TextStyle(color: AppTheme.textColor(themeIsDark)),
              ),
              value: themeIsDark,
              activeThumbColor: Colors.pink,
              onChanged: (value) {
                MyApp.of(context)?.changeTheme(value);
              },
            ),

            const SizedBox(height: 20),

            // Change app language to English.
            ListTile(
              title: Text(
                'english'.tr(),
                style: TextStyle(color: AppTheme.textColor(themeIsDark)),
              ),
              trailing: Icon(
                Icons.language,
                color: AppTheme.textColor(themeIsDark),
              ),
              onTap: () {
                context.setLocale(const Locale('en'));
              },
            ),

            // Change app language to Arabic.
            ListTile(
              title: Text(
                'arabic'.tr(),
                style: TextStyle(color: AppTheme.textColor(themeIsDark)),
              ),
              trailing: Icon(
                Icons.language,
                color: AppTheme.textColor(themeIsDark),
              ),
              onTap: () {
                context.setLocale(const Locale('ar'));
              },
            ),

            const SizedBox(height: 30),

            // Sign out from Firebase, then return to the login screen.
            PrimaryButton(
              text: logoutText,
              onPressed: () async {
                final navigator = Navigator.of(context);

                await _authService.logout();

                if (!mounted) return;

                navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              height: 56,
              backgroundColor: themeIsDark
                  ? const Color(0xFF2B1A1F)
                  : Colors.red.shade50,
              borderRadius: 14,
              contentAlignment: MainAxisAlignment.start,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(
                Icons.logout,
                color: themeIsDark ? Colors.red.shade300 : Colors.red,
              ),
              textStyle: TextStyle(
                color: themeIsDark ? Colors.red.shade300 : Colors.red.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
