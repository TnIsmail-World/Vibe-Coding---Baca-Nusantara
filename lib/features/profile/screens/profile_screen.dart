import 'package:flutter/material.dart';
import '../widgets/reading_stats_card.dart';
import '../widgets/achievement_card.dart';
import '../widgets/settings_list_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final sectionTitleColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profil',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: -0.374,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        // Avatar
                        Container(
                          width: 64,
                          height: 64,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2C2C2E), // Dark gray
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'D',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Name & Email
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dinda Ayu',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'dinda@email.com',
                              style: TextStyle(
                                fontSize: 14,
                                color: sectionTitleColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Statistics Card
              const ReadingStatsCard(),

              // Achievements Section
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Pencapaian',
                  style: TextStyle(
                    fontSize: 12,
                    color: sectionTitleColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 120, // Height for achievement cards
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AchievementCard(title: 'Pembaca Pagi'),
                    SizedBox(width: 12),
                    AchievementCard(title: '7 Hari\nBeruntun'),
                    SizedBox(width: 12),
                    AchievementCard(title: 'Sastra Lokal'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Settings List
              const SettingsListItem(
                title: 'Langganan',
                subtitle: 'Bulanan · aktif',
              ),
              const SettingsListItem(
                title: 'Riwayat transaksi',
                subtitle: '4 pembelian',
              ),
              const SettingsListItem(
                title: 'Unduhan & penyimpanan',
                subtitle: '312 MB',
              ),
              const SettingsListItem(
                title: 'Preferensi baca',
                subtitle: 'Sepia · 17pt',
              ),
              const SettingsListItem(
                title: 'Notifikasi',
                subtitle: 'Aktif',
              ),
              
              // Logout
              const SizedBox(height: 16),
              SettingsListItem(
                title: 'Keluar',
                isDestructive: true,
                onTap: () {
                  // Handle logout
                },
              ),
              const SizedBox(height: 48), // Bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
