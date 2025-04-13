// app_theme.dart
// هذا الملف يحتوي على تعريفات السمات (الفاتحة والداكنة) للتطبيق

import 'package:flutter/material.dart';

class AppTheme {
  // الألوان الثابتة المستخدمة في التطبيق
  static const Color lightBackground = Color(0xFFE0E0E0);
  static const Color darkBackground = Color(0xFF121212);
  
  static const Color lightDisplayColor = Color(0xFF333333);
  static const Color darkDisplayColor = Color(0xFFFFFFFF);
  
  static const Color lightButtonColor = Color(0xFFD0D0D0);
  static const Color darkButtonColor = Color(0xFF2A2A2A);
  
  static const Color lightOperatorColor = Color(0xFFE6D74E);
  static const Color darkOperatorColor = Color(0xFFE6D74E);
  
  static const Color lightTextColor = Color(0xFF333333);
  static const Color darkTextColor = Color(0xFFFFFFFF);

  // تعريف السمة الفاتحة
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    primaryColor: lightOperatorColor,
    colorScheme: const ColorScheme.light(
      primary: lightOperatorColor,
      secondary: lightButtonColor,
      surface: lightBackground,
      onSurface: lightTextColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: lightDisplayColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: lightDisplayColor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: lightTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  // تعريف السمة الداكنة
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: darkOperatorColor,
    colorScheme: const ColorScheme.dark(
      primary: darkOperatorColor,
      secondary: darkButtonColor,
      surface: darkBackground,
      onSurface: darkTextColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: darkDisplayColor,
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: darkDisplayColor,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: darkTextColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
