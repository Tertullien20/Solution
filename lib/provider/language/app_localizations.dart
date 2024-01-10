import 'language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLocalizations {
  final BuildContext context;

  AppLocalizations(this.context);

  final Map<String, Map<String, String>> _translations = {
    "hello_text": {
      "en": "Hello",
      "fr": "Bonjour",
      "es": "Hola",
      "de": "Hallo",
    },
    "welcome_message": {
      "en": "Welcome",
      "fr": "Bienvenue",
      "es": "En espagne bienvenue",
      "de": "en de bienv",
    },
    "what_your_language": {
      "en": "What is your \nlanguage?",
      "fr": "Quelle est votre \nlangue?",
      "es": "¿Cuál es su \nidioma?",
      "de": "Was ist Ihre \nSprache?",
    },
    "select_lang": {
      "en": "Select a language to get started.",
      "fr": "Sélectionnez une langue pour commencer.",
      "es": "Seleccione un idioma para empezar.",
      "de": "Wählen Sie eine Sprache, um loszulegen.",
    },
  };

  String translate(String key) {
    String languageCode = context.watch<LanguageProvider>().locale.languageCode;

    if (_translations.containsKey(key) && _translations[key]!.containsKey(languageCode)) {
      return _translations[key]![languageCode]!;
    } else {
      return key;
    }
  }
}
