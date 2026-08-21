import 'package:flutter/material.dart';
import '../../../shared/widgets/inputs/search_input.dart';
import '../../../shared/widgets/vertical_book_list_item.dart';
import '../widgets/recent_search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);
    final sectionTitleColor = isDark ? const Color(0xFF95979D) : const Color(0xFF86868B);

    final categories = ['Semua', 'Fiksi Sastra', 'Puisi', 'Bisnis', 'Sejarah'];

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: SearchInput(),
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
                    final isActive = index == 0; // Simulate "Semua" is active
                    return Container(
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
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Pencarian Terakhir
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pencarian terakhir',
                      style: TextStyle(
                        fontSize: 14,
                        color: sectionTitleColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const RecentSearchList(),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Sering dicari
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sering dicari',
                      style: TextStyle(
                        fontSize: 14,
                        color: sectionTitleColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const VerticalBookListItem(
                      title: 'Perahu Kertas di Muara',
                      author: 'Dinda Ayu Prameswari · Penerbit Cendana',
                      label: 'Termasuk langganan',
                      coverColor: Color(0xFF1E3A8A), // Dark blue
                    ),
                    const VerticalBookListItem(
                      title: 'Rumah Kayu di Ujung Musim',
                      author: 'Herman Sutanto · Rumah Baca Nusantara',
                      label: 'Termasuk langganan',
                      coverColor: Color(0xFFD97757), // Orange/Brown
                    ),
                    const VerticalBookListItem(
                      title: 'Skala Kecil, Dampak Besar',
                      author: 'Sari Wulandari · Penerbit Aksara Bisnis',
                      label: 'Rp89.000',
                      coverColor: Color(0xFFF3F1E7), // Light Sand
                    ),
                    const VerticalBookListItem(
                      title: 'Sajak-Sajak Hujan Sore',
                      author: 'Bagas Alfarizi · Penerbit Cendana',
                      label: 'Termasuk langganan',
                      coverColor: Color(0xFF96B89D), // Sage Green
                    ),
                    const VerticalBookListItem(
                      title: 'Arsip Kota yang Hilang',
                      author: 'Rangga Mahendra · Penerbit Lintas Waktu',
                      label: 'Rp76.000',
                      coverColor: Color(0xFF22262F), // Dark Gray
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
