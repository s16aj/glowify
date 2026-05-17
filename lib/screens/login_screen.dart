import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

import 'main_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                ),
                const SizedBox(height: 10),
                Text(
                  'welcome_back'.tr(),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 40),

                AppTextField(
                  controller: phoneController,
                  hintText: 'phone_number'.tr(),
                  style: GoogleFonts.playfairDisplay(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.playfairDisplay(
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  fillColor: isDark ? Colors.grey.shade900 : Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: passwordController,
                  hintText: 'password'.tr(),
                  obscureText: true,
                  style: GoogleFonts.playfairDisplay(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.playfairDisplay(
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  fillColor: isDark ? Colors.grey.shade900 : Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                PrimaryButton(
                  text: 'login'.tr(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainScreen()),
                      );
                    }
                  },
                  backgroundColor: Colors.pink.shade300,
                  borderRadius: 14,
                  textStyle: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'dont_have_account'.tr()} ',
                      style: GoogleFonts.playfairDisplay(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'sign_up'.tr(),
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.pink.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
