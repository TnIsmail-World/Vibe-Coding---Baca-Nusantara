import 'package:flutter/material.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/buttons/social_button.dart';
import '../../../shared/widgets/inputs/custom_text_field.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensuring background color adapts properly (white in light, black in dark)
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo Placeholder "BN"
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'BN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Title
              Text(
                'Selamat datang\nkembali',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  letterSpacing: -0.374,
                  height: 1.2, // Slightly tighter line height for multi-line title
                ),
              ),
              const SizedBox(height: 8),
              
              // Subtitle
              Text(
                'Masuk untuk melanjutkan bacaan dan pustaka Anda.',
                style: TextStyle(
                  fontSize: 17,
                  color: isDark ? const Color(0xFFCCCCCC) : const Color(0xFF86868B),
                ),
              ),
              const SizedBox(height: 32),

              // Inputs
              const CustomTextField(
                label: 'Email',
                hintText: 'nama@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Kata sandi',
                hintText: '........',
                obscureText: true,
              ),
              const SizedBox(height: 12),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Navigate to Forgot Password
                  },
                  child: Text(
                    'Lupa kata sandi?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              PrimaryButton(
                text: 'Masuk',
                onPressed: () {
                  // Handle login
                },
              ),
              const SizedBox(height: 32),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'atau',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: isDark ? const Color(0xFF333333) : const Color(0xFFE0E0E0))),
                ],
              ),
              const SizedBox(height: 32),

              // Social Button
              SocialButton(
                text: 'Lanjutkan dengan Google',
                onPressed: () {
                  // Handle google sign in
                },
              ),
              const SizedBox(height: 48),

              // Register Redirect
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                      ),
                      children: [
                        TextSpan(
                          text: 'Daftar',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
