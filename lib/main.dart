import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';

import 'features/auth/screens/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      themeMode: ThemeMode.dark, // Forced Dark Mode for preview
      home: const SplashScreen(),
    );
  }
}
