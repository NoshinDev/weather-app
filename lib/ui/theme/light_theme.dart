
import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
   const inter = TextStyle(
    fontFamily: 'Inter',
    letterSpacing: 0,
     color: Colors.black,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  const headline = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    decoration: TextDecoration.none,
    color: Colors.black,
    textBaseline: TextBaseline.alphabetic,
  );
  return base.copyWith(
    // primaryColor: Colors.white,
    // useMaterial3: true,
        primaryColor: Colors.blueAccent,
        cardColor: const Color(0xffffffff),
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
    // accentColor: Colors.black,
    // canvasColor: Colors.transparent,
    // primaryIconTheme: const IconThemeData(color: Colors.black),
     textTheme:  TextTheme(
      headlineLarge: headline.copyWith(fontSize: 40, height: 1.1),
      headlineMedium: headline.copyWith(fontSize: 32, height: 1.3),
      headlineSmall: headline.copyWith(fontSize: 20, height: 1.2),
      titleLarge: headline.copyWith(fontSize: 18, height: 1.3),
      titleMedium: headline.copyWith(fontSize: 16),
      titleSmall: headline.copyWith(fontSize: 14),
      labelLarge: inter.copyWith(fontSize: 16, ),
      bodyLarge: inter.copyWith(fontSize: 14, fontWeight: FontWeight.w700),    
      bodyMedium: inter.copyWith(fontSize: 14, ),
      bodySmall: inter.copyWith(fontSize: 14, fontWeight: FontWeight.w500)
    ),
  );
}