import 'package:flutter/material.dart';

class RecentSearchList extends StatelessWidget {
  const RecentSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final dividerColor = isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0);
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final iconColor = isDark ? const Color(0xFF86868B) : const Color(0xFF95979D);

    final searches = ['sastra pesisir', 'penerbit cendana', 'puisi 2025'];

    return Column(
      children: searches.map((query) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: iconColor, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    query,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: dividerColor, height: 1),
          ],
        );
      }).toList(),
    );
  }
}
