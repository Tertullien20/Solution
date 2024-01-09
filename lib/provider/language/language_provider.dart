import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  late SharedPreferences _preferences;
  Locale _locale = const Locale("en", "US");

  LanguageProvider() {
    _loadLocale();
  }

  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
    _saveLocale(locale);
    notifyListeners();
  }

  void changeLanguage(Locale locale) {
    _locale = locale;
    _saveLocale(locale);
    notifyListeners();
  }

  Future<void> _loadLocale() async {
    _preferences = await SharedPreferences.getInstance();
    final String? languageCode = _preferences.getString('languageCode');
    final String? countryCode = _preferences.getString('countryCode');
    if (languageCode != null && countryCode != null) {
      _locale = Locale(languageCode, countryCode);
      notifyListeners();
    }
  }

  Future<void> _saveLocale(Locale locale) async {
    await _preferences.setString('languageCode', locale.languageCode);
    await _preferences.setString('countryCode', locale.countryCode ?? '');
  }
}
