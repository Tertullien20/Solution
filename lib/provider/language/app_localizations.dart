import 'language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLocalizations {
  final BuildContext context;

  AppLocalizations(this.context);

  final Map<String, Map<String, String>> _translations = {
    "back": {
      "en": "Back",
      "fr": "Retour",
      "es": "Volver",
      "de": "Zurück",
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
    'enter_mail': {
      "en": "Enter your lightning address",
      "fr": "Saisissez votre adresse mail",
      "es": "Introduzca su dirección de rayos",
      "de": "Geben Sie Ihre Blitzadresse ein",
    },
    'password': {
      "en": "Password",
      "fr": "Mot de passe",
      "es": "Contraseña",
      "de": "Passwort",
    },
    'confirm_password': {
      "en": "Confirm password",
      "fr": "Confirmer le mot de passe",
      "es": "Confirmar contraseña",
      "de": "Bestätigen Sie das Passwort",
    },
    "continue": {
      "en": "Continue",
      "fr": "Continue",
      "es": "Continúe en",
      "de": "Weiter",
    },
    "previous": {
      "en": "Previous",
      "fr": "Précédent",
      "es": "Anterior",
      "de": "Vorherige",
    },
    "confirm": {
      "en": "Confirm",
      "fr": "Confirmer",
      "es": "Confirmar",
      "de": "Bestätigen",
    },
    "remember": {
      "en": "Remember",
      "fr": "Se souvenir",
      "es": "Recordar",
      "de": "Erinnern",
    },
    "signin": {
      "en": "Sign In",
      "fr": "Se connecter",
      "es": "Iniciar sesión",
      "de": "Anmelden",
    },
    "allfields": {
      "en": "All fields are required",
      "fr": "Tous les champs sont requis",
      "es": "Todos los campos son obligatorios",
      "de": "Alle Felder sind erforderlich",
    },
    "password_mismatch": {
      "en": "Passwords do not match",
      "fr": "Les mots de passe ne correspondent pas",
      "es": "Las contraseñas no coinciden",
      "de": "Passwörter stimmen nicht überein",
    },
    "min_characters": {
      "en": "Minimum 6 characters",
      "fr": "Minimum 6 caractères",
      "es": "Mínimo 6 caracteres",
      "de": "Mindestens 6 Zeichen",
    },
    "invalid_email": {
      "en": "Invalid email address",
      "fr": "Adresse e-mail invalide",
      "es": "Dirección de correo electrónico no válida",
      "de": "Ungültige E-Mail-Adresse",
    },
    "get_started": {
      "en": "Get Started",
      "fr": "Commencer",
      "es": "Comenzar",
      "de": "Starten",
    },
    "already_have_account": {
      "en": "ALREADY HAVE AN ACCOUNT?",
      "fr": "DÉJÀ UN COMPTE ?",
      "es": "¿YA TIENES UNA CUENTA?",
      "de": "SCHON EIN KONTO?",
    },
    "user_not_found_for_email": {
      "en": "No user found for this email",
      "fr": "Pas d'utilisateur trouvé pour ce mail",
      "es": "No se encontró usuario para este correo electrónico",
      "de": "Kein Benutzer für diese E-Mail-Adresse gefunden",
    },
    "recovery_email_sent": {
      "en": "We have sent you an email for recovery",
      "fr": "Nous vous avons envoyé un mail pour la récupération",
      "es": "Hemos enviado un correo electrónico para la recuperación",
      "de": "Wir haben Ihnen eine E-Mail zur Wiederherstellung gesendet",
    }












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
