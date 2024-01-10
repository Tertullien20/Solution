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
    "welcome_back": {
      "en": "Welcome back,",
      "fr": "Bienvenue,",
      "es": "Bienvenido de nuevo,",
      "de": "willkommen zurück,",
    },
    "have_account": {
      "en": "Don’t have an account yet? Sign Up",
      "fr": "Vous n'avez pas encore de compte ? S'inscrire",
      "es": "¿Aún no tiene una cuenta? Regístrese",
      "de": "Sie haben noch kein Konto? Anmelden",
    },
    "enter_address": {
      "en": "Get started by entering \nyour Lightning Address",
      "fr": "Commencez par saisir \nvotre adresse mail",
      "es": "Para empezar, introduce \ntu dirección Lightning",
      "de": "Beginnen Sie mit der Eingabe \nIhrer Lightning-Adresse",
    },
    "your_nickname": {
      "en": "What is your nickname?",
      "fr": "Quel est votre surnom ?",
      "es": "¿Cuál es su apodo?",
      "de": "Wie lautet Ihr Spitzname?",
    },
    "see_name": {
      "en": "This is what other community member see.",
      "fr": "C'est ce que voient les autres membres de la communauté.",
      "es": "Esto es lo que ven los demás miembros de la comunidad.",
      "de": "Das ist es, was andere Mitglieder der Gemeinschaft sehen.",
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
