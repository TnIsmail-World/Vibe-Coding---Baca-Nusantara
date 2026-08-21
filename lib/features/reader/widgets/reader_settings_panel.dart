import 'package:flutter/material.dart';
import '../screens/reader_screen.dart';

class ReaderSettingsPanel extends StatelessWidget {
  final ReaderThemeMode currentTheme;
  final ValueChanged<ReaderThemeMode> onThemeChanged;

  const ReaderSettingsPanel({
    super.key,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    Color subTextColor;
    Color activeThemeColor;
    Color inactiveThemeBorder;

    switch (currentTheme) {
      case ReaderThemeMode.light:
        bgColor = Colors.white;
        textColor = const Color(0xFF333333);
        subTextColor = const Color(0xFF999999);
        activeThemeColor = const Color(0xFFF0F0F0);
        inactiveThemeBorder = const Color(0xFFF0F0F0);
        break;
      case ReaderThemeMode.sepia:
        bgColor = const Color(0xFFEBE0CA); // Slightly darker sepia for the panel to differentiate from page
        textColor = const Color(0xFF423B33);
        subTextColor = const Color(0xFF8C8273);
        activeThemeColor = const Color(0xFFD6C8AE);
        inactiveThemeBorder = const Color(0xFFD6C8AE);
        break;
      case ReaderThemeMode.dark:
        bgColor = const Color(0xFF1D1D1F);
        textColor = Colors.white;
        subTextColor = const Color(0xFF95979D);
        activeThemeColor = const Color(0xFF383A41);
        inactiveThemeBorder = const Color(0xFF383A41);
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          top: BorderSide(
            color: inactiveThemeBorder,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 48), // Bottom padding for safe area
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Reading Progress
          Row(
            children: [
              Text(
                'Hal. 134',
                style: TextStyle(color: subTextColor, fontSize: 12),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0,
                    activeTrackColor: subTextColor,
                    inactiveTrackColor: inactiveThemeBorder,
                    thumbColor: subTextColor,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                  ),
                  child: Slider(
                    value: 0.43,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Text(
                '43%',
                style: TextStyle(color: subTextColor, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Font Size
          Row(
            children: [
              Text(
                'T',
                style: TextStyle(color: subTextColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 2.0,
                    activeTrackColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: inactiveThemeBorder,
                    thumbColor: Theme.of(context).primaryColor,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                  ),
                  child: Slider(
                    value: 0.5,
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '17pt',
                style: TextStyle(color: subTextColor, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Theme Options
          Row(
            children: [
              Icon(Icons.tune, color: subTextColor, size: 20),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: currentTheme == ReaderThemeMode.sepia 
                        ? const Color(0xFFF1E6D0) 
                        : (currentTheme == ReaderThemeMode.dark ? Colors.black : Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: inactiveThemeBorder,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => onThemeChanged(ReaderThemeMode.light),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            decoration: BoxDecoration(
                              color: currentTheme == ReaderThemeMode.light ? activeThemeColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'terang',
                                style: TextStyle(
                                  color: currentTheme == ReaderThemeMode.light ? textColor : subTextColor,
                                  fontSize: 13,
                                  fontWeight: currentTheme == ReaderThemeMode.light ? FontWeight.w500 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => onThemeChanged(ReaderThemeMode.sepia),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            decoration: BoxDecoration(
                              color: currentTheme == ReaderThemeMode.sepia ? activeThemeColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'sepia',
                                style: TextStyle(
                                  color: currentTheme == ReaderThemeMode.sepia ? textColor : subTextColor,
                                  fontSize: 13,
                                  fontWeight: currentTheme == ReaderThemeMode.sepia ? FontWeight.w500 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => onThemeChanged(ReaderThemeMode.dark),
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            decoration: BoxDecoration(
                              color: currentTheme == ReaderThemeMode.dark ? activeThemeColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'gelap',
                                style: TextStyle(
                                  color: currentTheme == ReaderThemeMode.dark ? textColor : subTextColor,
                                  fontSize: 13,
                                  fontWeight: currentTheme == ReaderThemeMode.dark ? FontWeight.w500 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Home Indicator mock
          Container(
            width: 120,
            height: 4,
            decoration: BoxDecoration(
              color: currentTheme == ReaderThemeMode.dark ? const Color(0xFF555555) : const Color(0xFFCCCCCC),
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
      ),
    );
  }
}
