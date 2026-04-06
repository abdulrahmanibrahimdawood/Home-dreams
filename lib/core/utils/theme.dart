import 'package:flutter/material.dart';

import 'app_colors.dart';

/// All palette values live in [AppColors]. This file maps them into [ThemeData]
/// / [ColorScheme] for light and dark so `Theme.of(context).colorScheme` stays consistent.
class AppTheme {
  // 🌞 LIGHT
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      primaryContainer: AppColors.lightPrimaryColor,
      onPrimaryContainer: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      onSecondary: const Color(0xFF1A120C),
      secondaryContainer: AppColors.lightSecondaryColor,
      onSecondaryContainer: const Color(0xFF1A120C),
      tertiary: AppColors.lightPrimaryColor,
      onTertiary: AppColors.primaryColor,
      error: AppColors.error,
      onError: Colors.white,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.textPrimaryLight,
      onSurfaceVariant: AppColors.textSecondaryLight,
      outline: AppColors.borderLight,
      outlineVariant: AppColors.dividerLight,
      surfaceContainerHighest: AppColors.cardLight,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    cardColor: AppColors.cardLight,
    dividerColor: AppColors.dividerLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Color(0xFF1A120C),
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.cardLight,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerLight,
      thickness: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.textHintLight),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryLight),
      bodyMedium: TextStyle(color: AppColors.textSecondaryLight),
      bodySmall: TextStyle(color: AppColors.textHintLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimaryLight,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.buttonPrimaryLight,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Color(0xFF1A120C),
    ),
  );

  // 🌙 DARK
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Cairo',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      onPrimary: Colors.white,
      primaryContainer: AppColors.lightPrimaryDark,
      onPrimaryContainer: Colors.white,
      secondary: AppColors.secondaryDark,
      onSecondary: Colors.black,
      secondaryContainer: AppColors.lightSecondaryDark,
      onSecondaryContainer: const Color(0xFF1A120C),
      tertiary: AppColors.lightPrimaryDark,
      onTertiary: Colors.white,
      error: AppColors.error,
      onError: Colors.white,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textPrimaryDark,
      onSurfaceVariant: AppColors.textSecondaryDark,
      outline: AppColors.borderDark,
      outlineVariant: AppColors.dividerDark,
      surfaceContainerHighest: AppColors.cardDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    cardColor: AppColors.cardDark,
    dividerColor: AppColors.dividerDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: const CardThemeData(
      color: AppColors.cardDark,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerDark,
      thickness: 1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.textHintDark),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryDark, width: 1.5),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark),
      bodyMedium: TextStyle(color: AppColors.textSecondaryDark),
      bodySmall: TextStyle(color: AppColors.textHintDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimaryDark,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColors.lightPrimaryDark),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryDark,
      foregroundColor: Colors.black,
    ),
  );
}
