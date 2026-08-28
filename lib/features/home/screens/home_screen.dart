import 'package:flutter/material.dart';
import '../../../shared/widgets/section_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/continue_reading_card.dart';
import '../widgets/horizontal_book_list.dart';
import '../widgets/category_chips.dart';
import '../../../core/data/app_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1D1D1F);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jumat, 31 Juli',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Beranda',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                        letterSpacing: -0.374,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const PromoBanner(),
                  ],
                ),
              ),

              // Lanjutkan Baca
              const SectionHeader(title: 'Lanjutkan Baca'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ContinueReadingCard(
                  title: 'Perahu Kertas di Muara',
                  author: 'Dinda Ayu Prameswari',
                  progressText: '43% · halaman 134 dari 312',
                  progressValue: 0.43,
                  coverColor: Color(0xFF1E3A8A),
                  shortTitle: 'Per\nahu\nKer\n...',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ContinueReadingCard(
                  title: 'Rumah Kayu di Ujung Musim',
                  author: 'Herman Sutanto',
                  progressText: '71% · halaman 190 dari 268',
                  progressValue: 0.71,
                  coverColor: Color(0xFFD97757),
                  shortTitle: 'Rum\nah \nKay\n...',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: ContinueReadingCard(
                  title: 'Pendekar Sakura Vol. 1',
                  author: 'Yudha Kuswadi',
                  progressText: '18% · halaman 35 dari 192',
                  progressValue: 0.18,
                  coverColor: Colors.black, // fallback
                  shortTitle: '',
                  imageUrl: 'https://picsum.photos/seed/sakura/120/180',
                ),
              ),

              // Populer
              SectionHeader(
                title: 'Populer',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: AppState.instance.allBooks.take(4).toList()),

              // Rilis Baru
              SectionHeader(
                title: 'Rilis Baru',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: AppState.instance.allBooks.skip(4).take(4).toList()),

              // Cerita Anak Bergambar
              SectionHeader(
                title: 'Cerita Anak Bergambar',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: AppState.instance.allBooks.where((b) => b.category == 'Cerita Anak Bergambar').toList()),

              // Manga & Komik
              SectionHeader(
                title: 'Manga & Komik',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: AppState.instance.allBooks.where((b) => b.category == 'Manga & Komik').toList()),
              const SizedBox(height: 24),

              // Kategori
              const CategoryChips(),
            ],
          ),
        ),
      ),
    );
  }
}
