import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String iconPath; // Normally an asset path, we will simulate with an icon for now or leave it to standard Icon

  const SocialButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.iconPath = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        // Since we don't have the Google logo asset yet, we use a placeholder or basic icon
        // For production, use Image.asset(iconPath)
        icon: const Icon(Icons.g_mobiledata, color: Colors.blue, size: 28),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.374,
            color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE0E0E0), width: 1), // Hairline color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
