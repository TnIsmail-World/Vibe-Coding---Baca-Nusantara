import 'package:flutter/material.dart';

class AppTypography {
  static const String primaryFontFamily = 'SF Pro Display';
  static const String secondaryFontFamily = 'SF Pro Text';

  static const TextStyle heroDisplay = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 56,
    fontWeight: FontWeight.w600,
    height: 1.07,
    letterSpacing: -0.28,
  );

  static const TextStyle displayLg = TextStyle(
    fontFamily: primaryFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.w600,
    height: 1.1,
    letterSpacing: 0,
  );

  static const TextStyle body = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.47,
    letterSpacing: -0.374,
  );
  
  static const TextStyle caption = TextStyle(
    fontFamily: secondaryFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: -0.224,
  );
}
