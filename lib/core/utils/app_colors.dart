import 'package:flutter/material.dart';

abstract class AppColors {
  // =========================
  // LIGHT MODE
  // =========================
  
  // Primary & Secondary
  static const Color primaryColor = Color(0xff4C301C);
  static const Color lightPrimaryColor = Color(0xFFA97852);

  static const Color secondaryColor = Color(0xFFF4A91F);
  static const Color lightSecondaryColor = Color(0xFFF8C76D);

  // Backgrounds
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF5F5F5);
  static const Color cardLight = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimaryLight = Color(0xFF000000);
  static const Color textSecondaryLight = Color(0xFF6B6B6B);
  static const Color textHintLight = Color(0xFF9E9E9E);

  // Border / Divider
  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color dividerLight = Color(0xFFEEEEEE);

  // Buttons
  static const Color buttonPrimaryLight = primaryColor;
  static const Color buttonSecondaryLight = secondaryColor;

  // =========================
  //  DARK MODE
  // =========================

  // Primary & Secondary
  static const Color primaryDark = Color(0xFF2B1B12);
  static const Color lightPrimaryDark = Color(0xFF8C6239);

  static const Color secondaryDark = Color(0xFFD89B1A);
  static const Color lightSecondaryDark = Color(0xFFE6B85C);

  // Backgrounds
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color cardDark = Color(0xFF232323);

  // Text
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFBDBDBD);
  static const Color textHintDark = Color(0xFF9E9E9E);

  // Border / Divider
  static const Color borderDark = Color(0xFF2C2C2C);
  static const Color dividerDark = Color(0xFF3A3A3A);

  // Buttons
  static const Color buttonPrimaryDark = primaryDark;
  static const Color buttonSecondaryDark = secondaryDark;

  // =========================
  // COMMON 
  // =========================
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
}