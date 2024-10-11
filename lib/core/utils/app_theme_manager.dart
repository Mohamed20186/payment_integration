import 'package:flutter/material.dart';

class AppThemeManager {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    ),
  );
}
