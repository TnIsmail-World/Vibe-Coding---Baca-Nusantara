import 'package:flutter/material.dart';
import 'book_cover.dart';
import '../../features/book_detail/screens/book_detail_screen.dart';

class LibraryGridItem extends StatelessWidget {
  final String title;
  final String author;
  final double? progress; // 0.0 to 1.0, null if not started
  final Color coverColor;
  final String? imageUrl;

  const LibraryGridItem({
    super.key,
    required this.title,
    required this.author,
    this.progress,
    required this.coverColor,
    this.imageUrl,
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
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          child: BookCover(
            title: title,
            author: author,
            backgroundColor: coverColor,
            imageUrl: imageUrl,
            width: double.infinity,
            borderRadius: 8,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : const Color(0xFF1D1D1F),
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        if (progress != null) ...[
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: isDark ? const Color(0xFF383A41) : const Color(0xFFF0F0F0),
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          ),
        ] else ...[
          Text(
            'Belum dibaca',
            style: TextStyle(
              fontSize: 11,
              color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
            ),
          ),
        ]
      ],
      ),
    );
  }
}
