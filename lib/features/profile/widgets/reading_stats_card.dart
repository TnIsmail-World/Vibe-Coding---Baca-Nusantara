import 'package:flutter/material.dart';

class ReadingStatsCard extends StatelessWidget {
  const ReadingStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF2C2C2E), // Dark gray background from design
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistik baca',
            style: TextStyle(
              color: Color(0xFF95979D),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatItem('1.284', 'Menit baca', '30 hari terakhir'),
              _buildStatItem('7', 'Buku selesai', 'tahun ini'),
              _buildStatItem('23', 'Runtutan', 'hari berturut'),
            ],
          ),
          const SizedBox(height: 32),
          _buildChart(context),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF86868B),
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildChart(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final heights = [30.0, 50.0, 20.0, 60.0, 40.0, 80.0, 35.0];
    final labels = ['S', 'S', 'R', 'K', 'J', 'S', 'M'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(7, (index) {
        return Column(
          children: [
            Container(
              width: 32,
              height: heights[index],
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              labels[index],
              style: const TextStyle(
                color: Color(0xFF86868B),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      }),
    );
  }
}
