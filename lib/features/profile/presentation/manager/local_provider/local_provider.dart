import 'package:flutter/material.dart';

enum AppLanguage { arabic, english }

class LocaleProvider extends ChangeNotifier {
  AppLanguage _currentLang = AppLanguage.arabic;

  AppLanguage get currentLang => _currentLang;

  Locale get locale {
    switch (_currentLang) {
      case AppLanguage.arabic:
        return const Locale('ar');
      case AppLanguage.english:
        return const Locale('en');
    }
  }

  void changeLanguage(AppLanguage lang) {
    _currentLang = lang;
    notifyListeners();
  }
}
