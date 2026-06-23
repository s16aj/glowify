import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth_service.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  bool isChecked = false;
  bool isLoading = false;

  Future<void> signUpUser() async {
    if (!_formKey.currentState!.validate()) return;

    if (!isChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the terms')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await _authService.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully')),
      );

      Navigator.pop(context);
    } catch (e) {
  if (!mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(e.toString()),
    ),
  );

  print(e);
}

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
      appBar: AppBar(
        backgroundColor: isDark ? Colors.black : const Color(0xffFFF1F5),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'create_account'.tr(),
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade300,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'join_today'.tr(),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 35),

                AppTextField(
                  controller: nameController,
                  hintText: 'full_name'.tr(),
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  fillColor: isDark ? Colors.grey.shade900 : Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                AppTextField(
                  controller: emailController,
                  hintText: 'email'.tr(),
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.poppins(
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

                const SizedBox(height: 18),

                AppTextField(
                  controller: phoneController,
                  hintText: 'phone_number'.tr(),
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.poppins(
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

                const SizedBox(height: 18),

                AppTextField(
                  controller: passwordController,
                  hintText: 'password'.tr(),
                  obscureText: true,
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  fillColor: isDark ? Colors.grey.shade900 : Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                AppTextField(
                  controller: confirmPasswordController,
                  hintText: 'confirm_password'.tr(),
                  obscureText: true,
                  style: GoogleFonts.poppins(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  hintStyle: GoogleFonts.poppins(
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  fillColor: isDark ? Colors.grey.shade900 : Colors.white,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.pink,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'terms'.tr(),
                        style: GoogleFonts.poppins(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                PrimaryButton(
                  text: isLoading ? 'Loading...' : 'sign_up'.tr(),
                  onPressed: isLoading ? null : signUpUser,
                  backgroundColor: Colors.pink.shade300,
                  borderRadius: 14,
                  textStyle: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'already_have_account'.tr()} ',
                      style: GoogleFonts.poppins(
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'sign_in'.tr(),
                        style: GoogleFonts.poppins(
                          color: Colors.pink.shade400,
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