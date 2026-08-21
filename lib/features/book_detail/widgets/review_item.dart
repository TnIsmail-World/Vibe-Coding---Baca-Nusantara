import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String author;
  final int rating;
  final String review;

  const ReviewItem({
    super.key,
    required this.author,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final subTextColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);
    final dividerColor = isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              author,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(width: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  size: 14,
                  color: textColor,
                );
              }),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          review,
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: subTextColor,
          ),
        ),
        const SizedBox(height: 16),
        Divider(color: dividerColor),
        const SizedBox(height: 16),
      ],
    );
  }
}
