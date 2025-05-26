import 'package:flutter/material.dart';

class AppTranslations {
  static const supportedLocales = [Locale('en'), Locale('vi')];
  static const path = "lib/src/core/translations";
  static const defaultLocale = Locale('en');

  static const String en = 'en';
  static const String vi = 'vi';

  static List<String> getAllCodes() {
    return [en, vi];
  }
}
