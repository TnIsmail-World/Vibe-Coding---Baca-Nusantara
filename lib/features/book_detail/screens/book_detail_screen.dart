import 'package:flutter/material.dart';
import '../../../shared/widgets/book_cover.dart';
import '../../home/widgets/horizontal_book_list.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../widgets/book_info_row.dart';
import '../widgets/review_item.dart';
import '../../reader/screens/reader_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final Color coverColor;
  final String? imageUrl;
  final double rating;
  final int reviewCount;
  final String publisher;

  const BookDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.coverColor,
    this.imageUrl,
    this.rating = 4.8,
    this.reviewCount = 1284,
    this.publisher = 'Penerbit Cendana · 2025',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final subTextColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);
    final dividerColor = isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0);
    final bottomBarBg = isDark ? const Color(0xFF1D1D1F) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.ios_share, color: Theme.of(context).primaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                // Book Cover
                SizedBox(
                  width: 160,
                  child: BookCover(
                    title: title,
                    author: author,
                    backgroundColor: coverColor,
                    imageUrl: imageUrl,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Title and Author
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  publisher,
                  style: TextStyle(
                    fontSize: 12,
                    color: subTextColor,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '($reviewCount ulasan)',
                      style: TextStyle(
                        fontSize: 14,
                        color: subTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Info Row
                const BookInfoRow(pages: 312, category: 'Fiksi Sastra', format: 'EPUB'),
                const SizedBox(height: 32),
                
                // Sinopsis
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sinopsis',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Sebuah novel tentang tiga bersaudara yang kembali ke kampung halaman di pesisir Jawa setelah dua puluh tahun, dan menemukan bahwa ingatan menyimpan lebih banyak air daripada muara itu sendiri.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: isDark ? const Color(0xFFCCCCCC) : const Color(0xFF424245),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Ulasan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ulasan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const ReviewItem(
                        author: 'Rani P.',
                        rating: 5,
                        review: 'Kalimatnya tenang tapi menohok. Selesai dalam dua malam.',
                      ),
                      const ReviewItem(
                        author: 'Yoga S.',
                        rating: 4,
                        review: 'Bagian tengah agak lambat, tapi penutupnya sepadan.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                // Buku terkait
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Buku terkait',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                HorizontalBookList(books: _getRelatedBooks()),
                
                // Padding for sticky bottom bar
                const SizedBox(height: 120),
              ],
            ),
          ),
          
          // Bottom Sticky Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32), // bottom padding for safe area
              decoration: BoxDecoration(
                color: bottomBarBg,
                border: Border(
                  top: BorderSide(color: dividerColor),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Termasuk langganan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Aktif hingga 28 Agu 2026',
                        style: TextStyle(
                          fontSize: 12,
                          color: subTextColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 120,
                    child: PrimaryButton(
                      text: 'Lanjutkan',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReaderScreen(bookTitle: title),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BookData> _getRelatedBooks() {
    return [
      BookData(title: 'Rumah Kayu di Ujung Musim', author: 'Herman Sutanto', coverColor: const Color(0xFFD97757)),
      BookData(title: 'Skala Kecil, Dampak Besar', author: 'Sari Wulandari', coverColor: const Color(0xFFF3F1E7)),
      BookData(title: 'Sajak-Sajak Hujan Sore', author: 'Bagas Alfarizi', coverColor: const Color(0xFF96B89D)),
    ];
  }
}
