import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  bool isLoading = false;
  bool isGoogleLoading = false;

  // Login using email and password.
  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      await _authService.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Check your email and password.'),
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Login using Google account.
  Future<void> loginWithGoogle() async {
    setState(() {
      isGoogleLoading = true;
    });

    try {
      await _authService.signInWithGoogle();

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Google Sign-In failed. Please try again.'),
        ),
      );
    }

    if (mounted) {
      setState(() {
        isGoogleLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppTheme.background(isDark),
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
                  style: AppTheme.titleStyle(fontSize: 52, letterSpacing: 2),
                ),

                const SizedBox(height: 10),

                Text(
                  'welcome_back'.tr(),
                  style: AppTheme.bodyStyle(
                    isDark: isDark,
                    fontSize: 18,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 40),

                AppTextField(
                  controller: emailController,
                  hintText: 'Email',
                  style: AppTheme.bodyStyle(isDark: isDark),
                  hintStyle: AppTheme.bodyStyle(
                    isDark: isDark,
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  fillColor: isDark ? Colors.grey.shade900 : Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: passwordController,
                  hintText: 'password'.tr(),
                  obscureText: true,
                  style: AppTheme.bodyStyle(isDark: isDark),
                  hintStyle: AppTheme.bodyStyle(
                    isDark: isDark,
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
                  text: isLoading ? 'Loading...' : 'login'.tr(),
                  onPressed: isLoading ? null : loginUser,
                  backgroundColor: Colors.pink.shade300,
                  borderRadius: 14,
                  textStyle: AppTheme.bodyStyle(
                    isDark: isDark,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 14),

                // Google Sign-In bonus button.
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: isGoogleLoading ? null : loginWithGoogle,
                    icon: const Text(
                      'G',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label: Text(
                      isGoogleLoading ? 'Loading...' : 'Continue with Google',
                      style: AppTheme.bodyStyle(
                        isDark: isDark,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textColor(isDark),
                      side: BorderSide(color: Colors.pink.shade200),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'dont_have_account'.tr()} ',
                      style: AppTheme.bodyStyle(isDark: isDark),
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
                        style: AppTheme.bodyStyle(
                          isDark: isDark,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryPink,
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
