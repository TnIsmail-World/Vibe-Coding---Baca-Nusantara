import 'package:flutter/material.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final String category;
  final Color coverColor;
  final String? imageUrl;
  final double? progress;
  final String label;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.coverColor,
    this.imageUrl,
    this.progress,
    this.label = '',
  });
}

class AppState extends ChangeNotifier {
  static final AppState instance = AppState._internal();
  AppState._internal();

  // Navigation state
  int currentTab = 0;
  String searchCategory = 'Semua';
  String searchQuery = '';

  // Book states
  Set<String> wishlistedIds = {};
  Set<String> downloadedIds = {};
  Set<String> purchasedIds = {'book1', 'book2'}; // Pre-purchased some
  Set<String> completedIds = {};

  final List<BookModel> allBooks = [
    BookModel(id: 'book1', title: 'Perahu Kertas di Muara', author: 'Dinda Ayu Prameswari', category: 'Fiksi Sastra', coverColor: const Color(0xFF1E3A8A), label: 'Termasuk langganan', progress: 0.43),
    BookModel(id: 'book2', title: 'Rumah Kayu di Ujung Musim', author: 'Herman Sutanto', category: 'Fiksi Sastra', coverColor: const Color(0xFFD97757), label: 'Termasuk langganan', progress: 0.71),
    BookModel(id: 'book3', title: 'Skala Kecil, Dampak Besar', author: 'Sari Wulandari', category: 'Bisnis', coverColor: const Color(0xFFF3F1E7), label: 'Rp89.000'),
    BookModel(id: 'book4', title: 'Sajak-Sajak Hujan Sore', author: 'Bagas Alfarizi', category: 'Puisi', coverColor: const Color(0xFF96B89D), label: 'Termasuk langganan'),
    BookModel(id: 'book5', title: 'Arsip Kota yang Hilang', author: 'Rangga Mahendra', category: 'Sejarah', coverColor: const Color(0xFF22262F), label: 'Rp76.000'),
    BookModel(id: 'book6', title: 'Misi Terakhir Jakarta Vol. 1', author: 'Bramantya Rizki', category: 'Manga & Komik', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/misi/120/180'),
    BookModel(id: 'book7', title: 'Senja di Atap Sekolah Vol. 2', author: 'Kirana Maheswari', category: 'Manga & Komik', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/senja/120/180'),
    BookModel(id: 'book8', title: 'Pendekar Sakura Vol. 1', author: 'Yudha Kuswadi', category: 'Manga & Komik', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/sakura/120/180', progress: 0.18),
    BookModel(id: 'book9', title: 'Hujan Pertama Kirana', author: 'Ratih Larasati', category: 'Cerita Anak Bergambar', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/hujan/120/180'),
    BookModel(id: 'book10', title: 'Kisah di Balik Awan', author: 'Maya', category: 'Cerita Anak Bergambar', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/awan/120/180'),
    BookModel(id: 'book11', title: 'Rimba dan Rimba', author: 'Melati Anggraini', category: 'Cerita Anak Bergambar', coverColor: Colors.black, imageUrl: 'https://picsum.photos/seed/rimba/120/180'),
  ];

  // Getters for filtered lists
  List<BookModel> get wishlistedBooks => allBooks.where((b) => wishlistedIds.contains(b.id)).toList();
  List<BookModel> get downloadedBooks => allBooks.where((b) => downloadedIds.contains(b.id)).toList();
  List<BookModel> get purchasedBooks => allBooks.where((b) => purchasedIds.contains(b.id)).toList();
  List<BookModel> get completedBooks => allBooks.where((b) => completedIds.contains(b.id)).toList();

  List<BookModel> get searchResults {
    return allBooks.where((b) {
      final matchesCategory = searchCategory == 'Semua' || b.category == searchCategory;
      final matchesQuery = searchQuery.isEmpty || 
          b.title.toLowerCase().contains(searchQuery.toLowerCase()) || 
          b.author.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }

  // Actions
  void changeTab(int index) {
    currentTab = index;
    notifyListeners();
  }

  void setSearchCategory(String category) {
    searchCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void toggleWishlist(String id) {
    if (wishlistedIds.contains(id)) {
      wishlistedIds.remove(id);
    } else {
      wishlistedIds.add(id);
    }
    notifyListeners();
  }

  void toggleDownload(String id) {
    if (downloadedIds.contains(id)) {
      downloadedIds.remove(id);
    } else {
      downloadedIds.add(id);
    }
    notifyListeners();
  }

  void togglePurchased(String id) {
    purchasedIds.add(id);
    notifyListeners();
  }

  void toggleCompleted(String id) {
    if (completedIds.contains(id)) {
      completedIds.remove(id);
    } else {
      completedIds.add(id);
    }
    notifyListeners();
  }

  BookModel? getBookById(String id) {
    try {
      return allBooks.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }

  BookModel? getBookByTitle(String title) {
    try {
      return allBooks.firstWhere((b) => b.title == title);
    } catch (_) {
      return null;
    }
  }
}
