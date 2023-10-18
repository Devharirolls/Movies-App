import 'dart:async';

import 'package:hive/hive.dart';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String languagecode);
  Future<String?> getPreferredLanguage();

  getPreferredTheme() {}

  updateTheme(themeName) {}
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String?> getPreferredLanguage() async {
    final languageBox = await Hive.openBox('languageBox');
    return languageBox.get('preferred_language');
  }

  @override
  Future<void> updateLanguage(String languagecode) async {
    final languageBox = await Hive.openBox('languageBox');
    unawaited(languageBox.put('preferred_language', languagecode));
  }

   @override
  Future<String> getPreferredTheme() async {
    final themeBox = await Hive.openBox('themeBox');
    return themeBox.get('preferred_theme') ?? 'dark';
  }

  @override
  Future<void> updateTheme(themeName) async {
    final themeBox = await Hive.openBox('themeBox');
    unawaited(themeBox.put('preferred_theme', themeName));
  }
}
