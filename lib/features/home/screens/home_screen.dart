import 'package:flutter/material.dart';
import '../../../shared/widgets/section_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/continue_reading_card.dart';
import '../widgets/horizontal_book_list.dart';
import '../widgets/category_chips.dart';

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
              HorizontalBookList(books: _getPopulerBooks()),

              // Rilis Baru
              SectionHeader(
                title: 'Rilis Baru',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: _getRilisBaruBooks()),

              // Cerita Anak Bergambar
              SectionHeader(
                title: 'Cerita Anak Bergambar',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: _getCeritaAnakBooks()),

              // Manga & Komik
              SectionHeader(
                title: 'Manga & Komik',
                onSeeAll: () {},
              ),
              HorizontalBookList(books: _getMangaBooks()),
              const SizedBox(height: 24),

              // Kategori
              const CategoryChips(),
            ],
          ),
        ),
      ),
    );
  }

  List<BookData> _getPopulerBooks() {
    return [
      BookData(title: 'Perahu Kertas di Muara', author: 'Dinda Ayu Prameswari', coverColor: const Color(0xFF1E3A8A)),
      BookData(title: 'Rumah Kayu di Ujung Musim', author: 'Herman Sutanto', coverColor: const Color(0xFFD97757)),
      BookData(title: 'Skala Kecil, Dampak Besar', author: 'Sari Wulandari', coverColor: const Color(0xFFF3F1E7)),
      BookData(title: 'Sajak-Sajak Hujan Sore', author: 'Bagas Alfarizi', coverColor: const Color(0xFF96B89D)),
    ];
  }

  List<BookData> _getRilisBaruBooks() {
    return [
      BookData(title: 'Misi Terakhir Jakarta Vol. 1', author: 'Bramantya Rizki', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/misi/120/180'),
      BookData(title: 'Senja di Atap Sekolah Vol. 2', author: 'Kirana Maheswari', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/senja/120/180'),
      BookData(title: 'Pendekar Sakura Vol. 1', author: 'Yudha Kuswadi', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/sakura/120/180'),
      BookData(title: 'Kisah di Balik Awan', author: 'Maya', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/awan/120/180'),
    ];
  }

  List<BookData> _getCeritaAnakBooks() {
    return [
      BookData(title: 'Hujan Pertama Kirana', author: 'Ratih Larasati', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/hujan/120/180'),
      BookData(title: 'Perahu Kertas Bimo', author: 'Aryo Prayoga', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/perahu/120/180'),
      BookData(title: 'Rimba dan Rimba', author: 'Melati Anggraini', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/rimba/120/180'),
      BookData(title: 'Petualangan Dino', author: 'Ahmad', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/dino/120/180'),
    ];
  }

  List<BookData> _getMangaBooks() {
    return [
      BookData(title: 'Pendekar Sakura Vol. 1', author: 'Yudha Kuswadi', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/sakura/120/180'),
      BookData(title: 'Senja di Atap Sekolah Vol. 2', author: 'Kirana Maheswari', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/senja/120/180'),
      BookData(title: 'Misi Terakhir Jakarta Vol. 1', author: 'Bramantya Rizki', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/misi/120/180'),
      BookData(title: 'Sang Ksatria Hitam', author: 'Doni', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/ksatria/120/180'),
    ];
  }
}
