import 'package:flutter/material.dart';
import '../widgets/library_segmented_control.dart';
import '../../../shared/widgets/library_grid_item.dart';
import '../../../core/data/app_state.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);

    // Filter books based on selected tab
    List<BookModel> displayBooks = [];
    if (_selectedTab == 0) {
      displayBooks = AppState.instance.purchasedBooks;
    } else if (_selectedTab == 1) {
      displayBooks = AppState.instance.downloadedBooks;
    } else if (_selectedTab == 2) {
      displayBooks = AppState.instance.wishlistedBooks;
    } else if (_selectedTab == 3) {
      displayBooks = AppState.instance.completedBooks;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
              child: Text(
                'Pustaka',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  letterSpacing: -0.374,
                ),
              ),
            ),

            // Segmented Control
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LibrarySegmentedControl(
                segments: const ['Dibeli', 'Unduhan', 'Wishlist', 'Selesai'],
                selectedIndex: _selectedTab,
                onSegmentChanged: (index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            // Grid Content
            Expanded(
              child: displayBooks.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada buku di kategori ini.',
                        style: TextStyle(
                          color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                        ),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.55, // Adjusted to fit cover + text
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 24.0,
                      ),
                      itemCount: displayBooks.length,
                      itemBuilder: (context, index) {
                        final book = displayBooks[index];
                        return LibraryGridItem(
                          title: book.title,
                          author: book.author,
                          progress: book.progress,
                          coverColor: book.coverColor,
                          imageUrl: book.imageUrl,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
