import 'package:flutter/material.dart';
import '../widgets/library_segmented_control.dart';
import '../../../shared/widgets/library_grid_item.dart';

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
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.55, // Adjusted to fit cover + text
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 24.0,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return LibraryGridItem(
                    title: _getDummyTitle(index),
                    author: _getDummyAuthor(index),
                    progress: index < 2 ? (index == 0 ? 0.3 : 0.6) : null,
                    coverColor: _getDummyColor(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDummyTitle(int index) {
    const titles = [
      'Perahu Kertas di Muara',
      'Rumah Kayu di Ujung Musim',
      'Skala Kecil, Dampak Besar',
      'Sajak-Sajak Hujan Sore',
      'Arsip Kota yang Hilang',
      'Dapur Ibu, Sebuah Peta',
    ];
    return titles[index % titles.length];
  }

  String _getDummyAuthor(int index) {
    const authors = [
      'Dinda Ayu Pramesw...',
      'Herman Sutanto',
      'Sari Wulandari',
      'Bagas Alfarizi',
      'Rangga Mahendra',
      'Nur Aisyah',
    ];
    return authors[index % authors.length];
  }

  Color _getDummyColor(int index) {
    const colors = [
      Color(0xFF1E3A8A), // Dark blue
      Color(0xFFD97757), // Orange/Brown
      Color(0xFFF3F1E7), // Light Sand
      Color(0xFF96B89D), // Sage Green
      Color(0xFF22262F), // Dark Gray
      Color(0xFFD97757), // Orange/Brown again
    ];
    return colors[index % colors.length];
  }
}
