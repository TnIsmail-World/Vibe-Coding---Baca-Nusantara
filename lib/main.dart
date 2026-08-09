import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';

import 'features/auth/screens/splash_screen.dart';

void main() {
  runApp(const BacaNusantaraApp());
}

class BacaNusantaraApp extends StatelessWidget {
  const BacaNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BacaNusantara',
      theme: AppColors.lightTheme,
      darkTheme: AppColors.darkTheme,
      themeMode: ThemeMode.system, // Supports automatic light/dark mode switching
      home: const SplashScreen(),
    );
  }
}

