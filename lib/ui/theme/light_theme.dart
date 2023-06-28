
import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    // primaryColor: Colors.white,
    // useMaterial3: true,
        primaryColor: Colors.blueAccent,
        cardColor: const Color(0xffffffff),
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
    // accentColor: Colors.black,
    // canvasColor: Colors.transparent,
    // primaryIconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontFamily: 'Sans',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24),
      bodyMedium: TextStyle(
          fontFamily: 'Sans',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24),
      bodySmall: TextStyle(
          fontFamily: 'Sans',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 18),
    ),
  );
}