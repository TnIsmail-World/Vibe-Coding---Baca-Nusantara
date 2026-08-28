import 'package:flutter/material.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/search/screens/search_screen.dart';
import '../../features/library/screens/library_screen.dart';
import '../../features/notifications/screens/notifications_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../shared/widgets/bottom_nav_bar.dart';

import '../data/app_state.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.instance,
      builder: (context, _) {
        return Scaffold(
          body: _screens[AppState.instance.currentTab],
          bottomNavigationBar: BottomNavBar(
            currentIndex: AppState.instance.currentTab,
            onTap: (index) {
              AppState.instance.changeTab(index);
            },
          ),
        );
      },
    );
  }
}
