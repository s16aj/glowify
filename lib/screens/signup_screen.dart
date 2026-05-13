import 'package:flutter/material.dart';

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

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF1F5),

      appBar: AppBar(
        backgroundColor: const Color(0xffFFF1F5),
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade300,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Join Glowify today',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 35),

              buildTextField(
                controller: nameController,
                hint: 'Full Name',
              ),

              const SizedBox(height: 18),

              buildTextField(
                controller: emailController,
                hint: 'Email',
              ),

              const SizedBox(height: 18),

              buildTextField(
                controller: phoneController,
                hint: 'Phone Number',
              ),

              const SizedBox(height: 18),

              buildTextField(
                controller: passwordController,
                hint: 'Password',
                isPassword: true,
              ),

              const SizedBox(height: 18),

              buildTextField(
                controller: confirmPasswordController,
                hint: 'Confirm Password',
                isPassword: true,
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

                  const Expanded(
                    child: Text(
                      'I agree to the terms and conditions',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade300,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text('Already have an account? '),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },

                    child: Text(
                      'Sign In',
                      style: TextStyle(
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
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,

      decoration: InputDecoration(
        hintText: hint,

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}