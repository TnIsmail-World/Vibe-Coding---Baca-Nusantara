import 'package:flutter/material.dart';
import '../../../shared/widgets/book_cover.dart';
import '../../book_detail/screens/book_detail_screen.dart';
import '../../../core/data/app_state.dart';

class HorizontalBookList extends StatelessWidget {
  final List<BookModel> books;

  const HorizontalBookList({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260, // Increased height to prevent overflow
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
          final subTextColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);
          final book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(
                    title: book.title,
                    author: book.author,
                    coverColor: book.coverColor,
                    imageUrl: book.imageUrl,
                  ),
                ),
              );
            },
            child: SizedBox(
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookCover(
                    title: book.title,
                    author: book.author,
                    backgroundColor: book.coverColor,
                    imageUrl: book.imageUrl,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    book.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontSize: 12,
                      color: subTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
