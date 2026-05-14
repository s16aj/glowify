import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

import '../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    final logoutText = context.locale.languageCode == 'ar'
        ? 'تسجيل الخروج'
        : 'Log Out';

    return Scaffold(
      backgroundColor: themeIsDark ? Colors.black : const Color(0xffFFF1F5),
      appBar: AppBar(
        title: Text(
          'settings'.tr(),
          style: TextStyle(color: themeIsDark ? Colors.white : Colors.black),
        ),
        backgroundColor: themeIsDark ? Colors.black : const Color(0xffFFF1F5),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'dark_mode'.tr(),
                style: TextStyle(
                  color: themeIsDark ? Colors.white : Colors.black,
                ),
              ),
              value: themeIsDark,
              activeThumbColor: Colors.pink,
              onChanged: (value) {
                MyApp.of(context)?.changeTheme(value);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                'english'.tr(),
                style: TextStyle(
                  color: themeIsDark ? Colors.white : Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.language,
                color: themeIsDark ? Colors.white : Colors.black,
              ),
              onTap: () {
                context.setLocale(const Locale('en'));
              },
            ),
            ListTile(
              title: Text(
                'arabic'.tr(),
                style: TextStyle(
                  color: themeIsDark ? Colors.white : Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.language,
                color: themeIsDark ? Colors.white : Colors.black,
              ),
              onTap: () {
                context.setLocale(const Locale('ar'));
              },
            ),
            const SizedBox(height: 30),

            ListTile(
              tileColor: themeIsDark
                  ? const Color(0xFF2B1A1F)
                  : Colors.red.shade50,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              leading: Icon(
                Icons.logout,
                color: themeIsDark ? Colors.red.shade300 : Colors.red,
              ),

              title: Text(
                logoutText,
                style: TextStyle(
                  color: themeIsDark
                      ? Colors.red.shade300
                      : Colors.red.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),

              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
