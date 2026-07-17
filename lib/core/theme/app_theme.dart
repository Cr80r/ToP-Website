import 'package:flutter/material.dart';

class ZayloColors {
  static const primary = Color(0xFF0E7C66);
  static const background = Color(0xFFF7F8F6);
  static const darkBackground = Color(0xFF101514);
  static const text = Color(0xFF17201D);
  static const muted = Color(0xFF65736F);
}

class ZayloSpacing { static const xs=4.0, sm=8.0, md=16.0, lg=24.0, xl=32.0; }
class ZayloRadius { static const sm=10.0, md=16.0, lg=24.0; }

class AppTheme {
  static ThemeData light() => _theme(Brightness.light);
  static ThemeData dark() => _theme(Brightness.dark);
  static ThemeData _theme(Brightness b) {
    final dark = b == Brightness.dark;
    final scheme = ColorScheme.fromSeed(seedColor: ZayloColors.primary, brightness: b);
    return ThemeData(
      useMaterial3: true,
      brightness: b,
      colorScheme: scheme,
      scaffoldBackgroundColor: dark ? ZayloColors.darkBackground : ZayloColors.background,
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        headlineMedium: TextStyle(fontWeight: FontWeight.w800, color: dark ? Colors.white : ZayloColors.text),
        titleLarge: const TextStyle(fontWeight: FontWeight.w700),
        titleMedium: const TextStyle(fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(color: dark ? Colors.white70 : ZayloColors.text),
      ),
      cardTheme: CardTheme(surfaceTintColor: Colors.transparent, elevation: 1.5, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ZayloRadius.md))),
      inputDecorationTheme: InputDecorationTheme(filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(ZayloRadius.md), borderSide: BorderSide.none)),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ZayloRadius.md)))),
    );
  }
}
