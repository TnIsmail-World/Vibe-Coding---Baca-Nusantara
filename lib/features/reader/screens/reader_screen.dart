import 'package:flutter/material.dart';
import '../widgets/reader_settings_panel.dart';

enum ReaderThemeMode { light, sepia, dark }

class ReaderScreen extends StatefulWidget {
  final String bookTitle;

  const ReaderScreen({
    super.key,
    required this.bookTitle,
  });

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  ReaderThemeMode _currentTheme = ReaderThemeMode.sepia; // Defaulting to sepia to showcase the feature

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    Color subTextColor;

    switch (_currentTheme) {
      case ReaderThemeMode.light:
        bgColor = Colors.white;
        textColor = const Color(0xFF333333);
        subTextColor = const Color(0xFF999999);
        break;
      case ReaderThemeMode.sepia:
        bgColor = const Color(0xFFF1E6D0);
        textColor = const Color(0xFF423B33);
        subTextColor = const Color(0xFF8C8273);
        break;
      case ReaderThemeMode.dark:
        bgColor = const Color(0xFF111111);
        textColor = const Color(0xFFE5E5E5);
        subTextColor = const Color(0xFF888888);
        break;
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: subTextColor, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.bookTitle,
          style: TextStyle(
            color: subTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: subTextColor, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark_border, color: subTextColor, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bab Satu',
                  style: TextStyle(
                    color: subTextColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Muara',
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 32),
                _buildParagraph(
                  'Air di muara itu tidak pernah benar-benar tenang. Ia hanya berpura-pura, seperti orang dewasa yang sudah terlalu lama belajar menahan suara.',
                  textColor,
                ),
                _buildParagraph(
                  'Sejak pagi, perahu-perahu kecil berjejer seperti tanda baca di sepanjang tepi. Ada yang miring, ada yang tenggelam separuh, ada yang menunggu pemiliknya yang mungkin tidak akan datang lagi.',
                  textColor,
                ),
                _buildParagraph(
                  'Aku berdiri di sana, dua puluh tahun lebih tua dari terakhir kali, dan menyadari bahwa ingatan bekerja persis seperti pasang: ia surut supaya kita percaya semuanya sudah pergi, lalu kembali tanpa memberi kabar.',
                  textColor,
                ),
                _buildParagraph(
                  'Ibu pernah bilang, kalau kau lupa jalan pulang, ikuti saja arah air. Air selalu tahu ke mana rumah menuju. Aku tidak pernah tahu apakah itu nasihat atau doa.',
                  textColor,
                ),
                _buildParagraph(
                  'Di kejauhan, seseorang memanggil namaku dengan cara yang hanya dilakukan orang-orang di kampung ini — memanjangkan suku kata terakhir, seolah nama adalah sesuatu yang perlu diantar sampai tujuan.',
                  textColor,
                ),
              ],
            ),
          ),
          // Bottom Settings Panel
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ReaderSettingsPanel(
              currentTheme: _currentTheme,
              onThemeChanged: (theme) {
                setState(() {
                  _currentTheme = theme;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Georgia',
          fontSize: 17,
          height: 1.8,
          color: textColor,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
