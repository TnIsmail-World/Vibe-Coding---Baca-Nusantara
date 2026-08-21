import 'package:flutter/material.dart';

class BookInfoRow extends StatelessWidget {
  final int pages;
  final String category;
  final String format;

  const BookInfoRow({
    super.key,
    required this.pages,
    required this.category,
    required this.format,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final labelColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);
    final borderColor = isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInfoItem('Halaman', pages.toString(), textColor, labelColor),
          Container(width: 1, height: 40, color: borderColor),
          _buildInfoItem('Kategori', category, textColor, labelColor),
          Container(width: 1, height: 40, color: borderColor),
          _buildInfoItem('Format', format, textColor, labelColor),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, Color textColor, Color labelColor) {
    return Expanded(
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: labelColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
