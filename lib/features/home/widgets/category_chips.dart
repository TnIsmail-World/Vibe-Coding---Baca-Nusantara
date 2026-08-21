import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  final List<String> categories = const [
    'Fiksi Sastra', 'Puisi', 'Bisnis', 'Sejarah',
    'Kuliner', 'Anak', 'Pengembangan Diri', 'Agama',
    'Manga & Komik'
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      width: double.infinity,
      color: isDark ? const Color(0xFF272729) : const Color(0xFFF5F5F7),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF1D1D1F),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: categories.map((category) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1D1D1F) : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0),
                  ),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white : const Color(0xFF1D1D1F),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          Text(
            'BacaNusantara — platform baca buku digital untuk penerbit lokal Indonesia. Prototipe desain.',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
            ),
          ),
        ],
      ),
    );
  }
}
