import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchInput({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: 44, // standard Apple search bar height
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1D1D1F) : const Color(0xFFF5F5F7), // subtle background
        borderRadius: BorderRadius.circular(10), // slight rounding, typical for search
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Judul, penulis, atau penerbit',
          hintStyle: TextStyle(
            color: isDark ? const Color(0xFF86868B) : const Color(0xFF95979D),
            fontSize: 17,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? const Color(0xFF86868B) : const Color(0xFF95979D),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        style: TextStyle(
          color: isDark ? Colors.white : const Color(0xFF1D1D1F),
          fontSize: 17,
        ),
      ),
    );
  }
}
