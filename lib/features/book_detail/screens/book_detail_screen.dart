import 'package:flutter/material.dart';
import '../../../shared/widgets/book_cover.dart';
import '../../home/widgets/horizontal_book_list.dart';
import '../../../shared/widgets/buttons/primary_button.dart';
import '../widgets/book_info_row.dart';
import '../../reader/screens/reader_screen.dart';
import '../../../core/data/app_state.dart';

class BookDetailScreen extends StatefulWidget {
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
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState.instance,
      builder: (context, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final bgColor = isDark ? Colors.black : Colors.white;
        final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
        final subTextColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);
        final dividerColor = isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0);
        final bottomBarBg = isDark ? const Color(0xFF1D1D1F) : Colors.white;

        final book = AppState.instance.getBookByTitle(widget.title);
        final bookId = book?.id ?? 'unknown';

        final isWishlisted = AppState.instance.wishlistedIds.contains(bookId);
        final isDownloaded = AppState.instance.downloadedIds.contains(bookId);
        final isPurchased = AppState.instance.purchasedIds.contains(bookId);
        final isCompleted = AppState.instance.completedIds.contains(bookId);

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
                icon: Icon(isCompleted ? Icons.check_circle : Icons.check_circle_outline, 
                  color: isCompleted ? Colors.green : Theme.of(context).primaryColor),
                tooltip: 'Tandai Selesai',
                onPressed: () {
                  if (bookId != 'unknown') AppState.instance.toggleCompleted(bookId);
                },
              ),
              IconButton(
                icon: Icon(isDownloaded ? Icons.download_done : Icons.download_outlined, 
                  color: isDownloaded ? Colors.blue : Theme.of(context).primaryColor),
                tooltip: 'Unduh',
                onPressed: () {
                  if (bookId != 'unknown') AppState.instance.toggleDownload(bookId);
                },
              ),
              IconButton(
                icon: Icon(isWishlisted ? Icons.favorite : Icons.favorite_border, 
                  color: isWishlisted ? Colors.red : Theme.of(context).primaryColor),
                tooltip: 'Wishlist',
                onPressed: () {
                  if (bookId != 'unknown') AppState.instance.toggleWishlist(bookId);
                },
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
                        title: widget.title,
                        author: widget.author,
                        backgroundColor: widget.coverColor,
                        imageUrl: widget.imageUrl,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Title and Author
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        widget.title,
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
                      widget.author,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.publisher,
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
                        const Icon(Icons.star, size: 16, color: Colors.orangeAccent),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.rating}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${widget.reviewCount} ulasan)',
                          style: TextStyle(
                            fontSize: 14,
                            color: subTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Info Row
                    BookInfoRow(pages: 312, category: book?.category ?? 'Umum', format: 'EPUB'),
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
                            'Sebuah buku yang menceritakan banyak hal menarik yang patut untuk dibaca. Temukan petualangan dan kisah mendalam di setiap halamannya.',
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
                    HorizontalBookList(books: AppState.instance.allBooks.take(3).toList()),
                    
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
                            isPurchased ? 'Sudah Dibeli' : (book?.label ?? 'Rp89.000'),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isPurchased ? 'Siap dibaca' : 'Beli untuk membaca penuh',
                            style: TextStyle(
                              fontSize: 12,
                              color: subTextColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 130,
                        child: PrimaryButton(
                          text: isPurchased ? 'Lanjutkan' : 'Beli Sekarang',
                          onPressed: () {
                            if (isPurchased) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReaderScreen(bookTitle: widget.title),
                                ),
                              );
                            } else {
                              if (bookId != 'unknown') {
                                AppState.instance.togglePurchased(bookId);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Buku berhasil dibeli!')),
                                );
                              }
                            }
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
      },
    );
  }
}
