import 'package:flutter/material.dart';
import 'book_cover.dart';
import '../../features/book_detail/screens/book_detail_screen.dart';

class VerticalBookListItem extends StatelessWidget {
  final String title;
  final String author;
  final String label; // "Termasuk langganan" or "Rp89.000"
  final Color coverColor;

  const VerticalBookListItem({
    super.key,
    required this.title,
    required this.author,
    required this.label,
    required this.coverColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailScreen(
              title: title,
              author: author,
              coverColor: coverColor,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookCover(
            title: title,
            author: author,
            backgroundColor: coverColor,
            width: 80,
            height: 120,
            borderRadius: 6,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 120, // matching BookCover height
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1D1D1F),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: isDark ? const Color(0xFFCCCCCC) : const Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
