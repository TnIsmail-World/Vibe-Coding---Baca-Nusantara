import 'package:flutter/material.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../../../shared/widgets/buttons/social_button.dart';
import '../../../shared/widgets/inputs/custom_text_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agreeToTerms = false;

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
                'Buat akun',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  letterSpacing: -0.374,
                ),
              ),
              const SizedBox(height: 8),
              
              // Subtitle
              Text(
                'Gratis. Coba langganan 7 hari tanpa biaya.',
                style: TextStyle(
                  fontSize: 17,
                  color: isDark ? const Color(0xFFCCCCCC) : const Color(0xFF86868B),
                ),
              ),
              const SizedBox(height: 32),

              // Inputs
              const CustomTextField(
                label: 'Nama lengkap',
                hintText: 'Nama Anda',
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Email',
                hintText: 'nama@email.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Kata sandi',
                hintText: 'Minimal 8 karakter',
                obscureText: true,
              ),
              const SizedBox(height: 24),

              // Terms & Conditions Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _agreeToTerms,
                      onChanged: (val) {
                        setState(() {
                          _agreeToTerms = val ?? false;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      activeColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Saya menyetujui Ketentuan Layanan dan Kebijakan Privasi BacaNusantara.',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Register Button
              PrimaryButton(
                text: 'Daftar',
                onPressed: () {
                  // Handle registration
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
                text: 'Daftar dengan Google',
                onPressed: () {
                  // Handle google sign in
                },
              ),
              const SizedBox(height: 48),

              // Login Redirect
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Sudah punya akun? ',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                      ),
                      children: [
                        TextSpan(
                          text: 'Masuk',
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
