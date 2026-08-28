import 'package:flutter/material.dart';
import '../../book_detail/screens/book_detail_screen.dart';

class ContinueReadingCard extends StatelessWidget {
  final String title;
  final String author;
  final String progressText;
  final double progressValue;
  final Color coverColor;
  final String? imageUrl;
  final String shortTitle;

  const ContinueReadingCard({
    super.key,
    required this.title,
    required this.author,
    required this.progressText,
    required this.progressValue,
    required this.coverColor,
    required this.shortTitle,
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
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF272729) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0),
          ),
        ),
        child: Row(
        children: [
          // Simulated Book Cover
          Container(
            width: 56,
            height: 80,
            decoration: BoxDecoration(
              color: coverColor,
              borderRadius: BorderRadius.circular(4),
              image: imageUrl != null 
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.3), 
                        BlendMode.darken,
                      ),
                    )
                  : null,
            ),
            padding: const EdgeInsets.all(4.0),
            child: imageUrl == null ? Text(
              shortTitle,
              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ) : null,
          ),
          const SizedBox(width: 16),
          Expanded(
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                  ),
                ),
                const SizedBox(height: 12),
                // Progress Bar
                LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: isDark ? const Color(0xFF383A41) : const Color(0xFFF0F0F0),
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
                const SizedBox(height: 8),
                Text(
                  progressText,
                  style: TextStyle(
                    fontSize: 10,
                    color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
          ),
        ],
      ),
      ),
    );
  }
}
