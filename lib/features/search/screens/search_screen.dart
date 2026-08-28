import 'package:flutter/material.dart';
import '../../../shared/widgets/inputs/search_input.dart';
import '../../../shared/widgets/vertical_book_list_item.dart';
import '../../../core/data/app_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final sectionTitleColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);

    final categories = ['Semua', 'Fiksi Sastra', 'Puisi', 'Bisnis', 'Sejarah', 'Cerita Anak Bergambar', 'Manga & Komik'];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                child: Text(
                  'Cari',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                    letterSpacing: -0.374,
                  ),
                ),
              ),

              // Search Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SearchInput(
                  onChanged: (val) {
                    AppState.instance.setSearchQuery(val);
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Filter Chips (Horizontal)
              SizedBox(
                height: 36,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isActive = categories[index] == AppState.instance.searchCategory;
                    return GestureDetector(
                      onTap: () {
                        AppState.instance.setSearchCategory(categories[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: isActive 
                              ? (isDark ? Colors.white : const Color(0xFF1D1D1F))
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isActive 
                                ? Colors.transparent 
                                : (isDark ? const Color(0xFF383A41) : const Color(0xFFE0E0E0)),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 14,
                            color: isActive 
                                ? (isDark ? Colors.black : Colors.white)
                                : (isDark ? Colors.white : const Color(0xFF1D1D1F)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Dynamic Search Results
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppState.instance.searchQuery.isEmpty && AppState.instance.searchCategory == 'Semua'
                          ? 'Sering dicari'
                          : 'Hasil Pencarian',
                      style: TextStyle(
                        fontSize: 14,
                        color: sectionTitleColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...AppState.instance.searchResults.map((book) {
                      return VerticalBookListItem(
                        title: book.title,
                        author: book.author,
                        label: book.label,
                        coverColor: book.coverColor,
                      );
                    }),
                    if (AppState.instance.searchResults.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        child: Center(
                          child: Text(
                            'Tidak ada buku yang ditemukan.',
                            style: TextStyle(color: sectionTitleColor),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
