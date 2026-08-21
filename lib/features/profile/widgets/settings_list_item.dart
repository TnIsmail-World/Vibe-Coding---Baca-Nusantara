import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isDestructive;
  final VoidCallback? onTap;

  const SettingsListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.isDestructive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE5E5EA),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isDestructive 
                    ? const Color(0xFFFF3B30) // Apple Red
                    : (isDark ? Colors.white : const Color(0xFF1D1D1F)),
                fontWeight: FontWeight.w400,
              ),
            ),
            if (subtitle != null) ...[
              Row(
                children: [
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: isDark ? const Color(0xFF95979D) : const Color(0xFF86868B),
                  ),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}
