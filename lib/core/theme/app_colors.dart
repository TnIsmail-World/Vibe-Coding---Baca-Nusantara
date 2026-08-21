import 'package:flutter/material.dart';

class AppColors {
  // Light Mode Colors (Extracted from Light Mode.tokens.json)
  static const Color lightTextPrimary = Color(0xFF1D1D1F); // Apple Ink
  static const Color lightTextSecondary = Color(0xFF86868B);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F7); // Apple Canvas Parchment
  static const Color lightPrimary = Color(0xFF0066CC); // Action Blue
  
  // Dark Mode Colors (Extracted from Dark Mode.tokens.json)
  static const Color darkTextPrimary = Color(0xFFF5F5F7); 
  static const Color darkTextSecondary = Color(0xFF86868B);
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkSurface = Color(0xFF1D1D1F);
  static const Color darkPrimary = Color(0xFF2997FF); // Primary on Dark

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimary,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(
        primary: lightPrimary,
        surface: lightSurface,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: darkPrimary,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: darkPrimary,
        surface: darkSurface,
      ),
    );
  }
}
