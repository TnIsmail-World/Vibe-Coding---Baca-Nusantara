import 'package:flutter/material.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final sectionTitleColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);
    final dividerColor = isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE5E5EA);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                child: Text(
                  'Notifikasi',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    letterSpacing: -0.374,
                  ),
                ),
              ),

              // Hari ini Section
              _buildSectionHeader('Hari ini', sectionTitleColor),
              Divider(color: dividerColor, height: 1),
              const NotificationItem(
                isUnread: true,
                title: 'Waktunya membaca',
                body: 'Anda tinggal 12 halaman dari target harian di Perahu Kertas di Muara.',
                time: '07.30',
              ),
              Divider(color: dividerColor, height: 1),
              const NotificationItem(
                isUnread: true,
                title: 'Rilis baru dari Penerbit Cendana',
                body: 'Sajak-Sajak Hujan Sore kini tersedia untuk pelanggan.',
                time: '06.10',
              ),
              Divider(color: dividerColor, height: 1),
              const SizedBox(height: 16),

              // Minggu ini Section
              _buildSectionHeader('Minggu ini', sectionTitleColor),
              Divider(color: dividerColor, height: 1),
              const NotificationItem(
                isUnread: false,
                title: 'Langganan diperpanjang',
                body: 'Paket Bulanan aktif hingga 28 Agustus 2026.',
                time: 'Sel',
              ),
              Divider(color: dividerColor, height: 1),
              const NotificationItem(
                isUnread: false,
                title: 'Unduhan selesai',
                body: 'Rumah Kayu di Ujung Musim siap dibaca tanpa koneksi.',
                time: 'Sen',
              ),
              Divider(color: dividerColor, height: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          color: color,
        ),
      ),
    );
  }
}
