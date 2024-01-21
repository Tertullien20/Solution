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
      "it": "Indietro",
      "ru": "Назад",
      "zh": "返回",
    },
    "welcome_message": {
      "en": "Welcome",
      "fr": "Bienvenue",
      "es": "En espagne bienvenue",
      "de": "en de bienv",
      "it": "Benvenuto",
      "ru": "Добро пожаловать",
      "zh": "欢迎",
    },
    "what_your_language": {
      "en": "What is your \nlanguage?",
      "fr": "Quelle est votre \nlangue?",
      "es": "¿Cuál es su \nidioma?",
      "de": "Was ist Ihre \nSprache?",
      "it": "Qual è la tua \nlingua?",
      "ru": "Какой у вас \nязык?",
      "zh": "你的语言是什么？",
    },
    "select_lang": {
      "en": "Select a language to get started.",
      "fr": "Sélectionnez une langue pour commencer.",
      "es": "Seleccione un idioma para empezar.",
      "de": "Wählen Sie eine Sprache, um loszulegen.",
      "it": "Seleziona una lingua per iniziare.",
      "ru": "Выберите язык, чтобы начать.",
      "zh": "选择一种语言开始。",
    },
    "welcome_back": {
      "en": "Welcome back,",
      "fr": "Bienvenue,",
      "es": "Bienvenido de nuevo,",
      "de": "willkommen zurück,",
      "it": "Bentornato,",
      "ru": "С возвращением,",
      "zh": "欢迎回来，",
    },
    "have_account": {
      "en": "Don’t have an account yet? Sign Up",
      "fr": "Vous n'avez pas encore de compte ? S'inscrire",
      "es": "¿Aún no tiene una cuenta? Regístrese",
      "de": "Sie haben noch kein Konto? Anmelden",
      "it": "Non hai ancora un account? Registrati",
      "ru": "Еще нет учетной записи? Зарегистрируйтесь",
      "zh": "还没有账号？注册",
    },
    "enter_address": {
      "en": "Get started by entering \nyour Lightning Address",
      "fr": "Commencez par saisir \nvotre adresse mail",
      "es": "Para empezar, introduce \ntu dirección Lightning",
      "de": "Beginnen Sie mit der Eingabe \nIhrer Lightning-Adresse",
      "it": "Inizia inserendo \nil tuo indirizzo Lightning",
      "ru": "Начните с ввода \nвашего адреса Lightning",
      "zh": "通过输入你的闪电地址开始",
    },
    "your_nickname": {
      "en": "What is your nickname?",
      "fr": "Quel est votre surnom ?",
      "es": "¿Cuál es su apodo?",
      "de": "Wie lautet Ihr Spitzname?",
      "it": "Qual è il tuo soprannome?",
      "ru": "Как ваше прозвище?",
      "zh": "你的昵称是什么？",
    },
    "see_name": {
      "en": "This is what other community member see.",
      "fr": "C'est ce que voient les autres membres de la communauté.",
      "es": "Esto es lo que ven los demás miembros de la comunidad.",
      "de": "Das ist es, was andere Mitglieder der Gemeinschaft sehen.",
      "it": "Questo è ciò che vedono gli altri membri della comunità.",
      "ru": "Это то, что видят другие члены сообщества.",
      "zh": "这是其他社区成员看到的。",
    },
    'enter_mail': {
      "en": "Enter your lightning address",
      "fr": "Saisissez votre adresse mail",
      "es": "Introduzca su dirección de rayos",
      "de": "Geben Sie Ihre Blitzadresse ein",
      "it": "Inserisci il tuo indirizzo Lightning",
      "ru": "Введите свой адрес Lightning",
      "zh": "输入你的闪电地址",
    },
    'password': {
      "en": "Password",
      "fr": "Mot de passe",
      "es": "Contraseña",
      "de": "Passwort",
      "it": "Password",
      "ru": "Пароль",
      "zh": "密码",
    },
    'confirm_password': {
      "en": "Confirm password",
      "fr": "Confirmer le mot de passe",
      "es": "Confirmar contraseña",
      "de": "Bestätigen Sie das Passwort",
      "it": "Conferma password",
      "ru": "Подтвердите пароль",
      "zh": "确认密码",
    },
    "continue": {
      "en": "Continue",
      "fr": "Continue",
      "es": "Continúe en",
      "de": "Weiter",
      "it": "Continua",
      "ru": "Продолжить",
      "zh": "继续",
    },
    "previous": {
      "en": "Previous",
      "fr": "Précédent",
      "es": "Anterior",
      "de": "Vorherige",
      "it": "Precedente",
      "ru": "Предыдущий",
      "zh": "上一页",
    },
    "confirm": {
      "en": "Confirm",
      "fr": "Confirmer",
      "es": "Confirmar",
      "de": "Bestätigen",
      "it": "Conferma",
      "ru": "Подтвердить",
      "zh": "确认",
    },
    "remember": {
      "en": "Remember",
      "fr": "Se souvenir",
      "es": "Recordar",
      "de": "Erinnern",
      "it": "Ricorda",
      "ru": "Запомнить",
      "zh": "记住",
    },
    "signin": {
      "en": "Sign In",
      "fr": "Se connecter",
      "es": "Iniciar sesión",
      "de": "Anmelden",
      "it": "Accedi",
      "ru": "Войти",
      "zh": "登录",
    },
    "allfields": {
      "en": "All fields are required",
      "fr": "Tous les champs sont requis",
      "es": "Todos los campos son obligatorios",
      "de": "Alle Felder sind erforderlich",
      "it": "Tutti i campi sono obbligatori",
      "ru": "Все поля обязательны к заполнению",
      "zh": "所有字段都是必填项",
    },
    "password_mismatch": {
      "en": "Passwords do not match",
      "fr": "Les mots de passe ne correspondent pas",
      "es": "Las contraseñas no coinciden",
      "de": "Passwörter stimmen nicht überein",
      "it": "Le password non corrispondono",
      "ru": "Пароли не совпадают",
      "zh": "密码不匹配",
    },
    "min_characters": {
      "en": "Minimum 6 characters",
      "fr": "Minimum 6 caractères",
      "es": "Mínimo 6 caracteres",
      "de": "Mindestens 6 Zeichen",
      "it": "Minimo 6 caratteri",
      "ru": "Минимум 6 символов",
      "zh": "最少6个字符",
    },
    "invalid_email": {
      "en": "Invalid email address",
      "fr": "Adresse e-mail invalide",
      "es": "Dirección de correo electrónico no válida",
      "de": "Ungültige E-Mail-Adresse",
      "it": "Indirizzo email non valido",
      "ru": "Неверный адрес электронной почты",
      "zh": "无效的电子邮件地址",
    },
    "get_started": {
      "en": "Get Started",
      "fr": "Commencer",
      "es": "Comenzar",
      "de": "Starten",
      "it": "Inizia",
      "ru": "Начать",
      "zh": "开始",
    },
    "already_have_account": {
      "en": "ALREADY HAVE AN ACCOUNT?",
      "fr": "DÉJÀ UN COMPTE ?",
      "es": "¿YA TIENES UNA CUENTA?",
      "de": "SCHON EIN KONTO?",
      "it": "GIÀ UN ACCOUNT?",
      "ru": "УЖЕ ЕСТЬ АККАУНТ?",
      "zh": "已经有账号？",
    },
    "user_not_found_for_email": {
      "en": "No user found for this email",
      "fr": "Pas d'utilisateur trouvé pour ce mail",
      "es": "No se encontró usuario para este correo electrónico",
      "de": "Kein Benutzer für diese E-Mail-Adresse gefunden",
      "it": "Nessun utente trovato per questa email",
      "ru": "Пользователь с этим адресом электронной почты не найден",
      "zh": "找不到此电子邮件的用户",
    },
    "recovery_email_sent": {
      "en": "We have sent you an email for recovery",
      "fr": "Nous vous avons envoyé un mail pour la récupération",
      "es": "Hemos enviado un correo electrónico para la recuperación",
      "de": "Wir haben Ihnen eine E-Mail zur Wiederherstellung gesendet",
      "it": "Ti abbiamo inviato un'email per il recupero",
      "ru": "Мы отправили вам электронное письмо для восстановления",
      "zh": "我们已向您发送了一封恢复邮件",
    },
    "receive_mail": {
      "en": "Receive Mail",
      "fr": "Recevoir un courrier",
      "es": "Recibir correo",
      "de": "E-Mail empfangen",
      "it": "Ricevi posta",
      "ru": "Получить почту",
      "zh": "接收邮件",
    },
    "forget_password": {
      "en": "Forget password?",
      "fr": "Mot de passe oublié ?",
      "es": "¿Olvidó la contraseña?",
      "de": "Passwort vergessen?",
      "it": "Hai dimenticato la password?",
      "ru": "Забыли пароль?",
      "zh": "忘记密码？",
    },

    "incorrect_email_password": {
      "en": "Email or password incorrect.",
      "fr": "Email ou mot de passe incorrect.",
      "es": "Correo electrónico o contraseña incorrecta.",
      "de": "E-Mail oder Passwort inkorrekt.",
      "it": "Email o password errata.",
      "ru": "Неверный адрес электронной почты или пароль.",
      "zh": "电子邮件或密码不正确。",
    },

    "login_operation_disabled": {
      "en": "Login operation has been disabled for now.",
      "fr": "L'opération de connexion a été désactivée pour le moment.",
      "es": "La operación de inicio de sesión ha sido desactivada por el momento.",
      "de": "Der Anmeldevorgang wurde vorübergehend deaktiviert.",
      "it": "L'operazione di accesso è stata disabilitata per il momento.",
      "ru": "Операция входа временно отключена.",
      "zh": "登录操作暂时已禁用。",
    },

    "account_deactivated": {
      "en": "This account has been deactivated.",
      "fr": "Ce compte a été désactivé.",
      "es": "Esta cuenta ha sido desactivada.",
      "de": "Dieses Konto wurde deaktiviert.",
      "it": "Questo account è stato disattivato.",
      "ru": "Этот аккаунт деактивирован.",
      "zh": "此帐户已停用。",
    },

    "device_blocked": {
      "en": "We have blocked all requests from this device due to unusual activity. Please try again later.",
      "fr": "Nous avons bloqué toutes les demandes en provenance de cet appareil en raison d'une activité inhabituelle. Veuillez réessayer plus tard.",
      "es": "Hemos bloqueado todas las solicitudes desde este dispositivo debido a actividad inusual. Por favor, inténtalo de nuevo más tarde.",
      "de": "Wir haben aufgrund ungewöhnlicher Aktivitäten alle Anfragen von diesem Gerät blockiert. Bitte versuchen Sie es später erneut.",
      "it": "Abbiamo bloccato tutte le richieste da questo dispositivo a causa di attività insolita. Riprova più tardi.",
      "ru": "Мы заблокировали все запросы с этого устройства из-за необычной активности. Пожалуйста, повторите попытку позже.",
      "zh": "由于异常活动，我们已阻止来自此设备的所有请求。请稍后再试。",
    },
    "check_internet_connection": {
      "en": "Check your internet connection and try again.",
      "fr": "Vérifiez votre connexion internet puis réessayer.",
      "es": "Verifica tu conexión a internet e inténtalo de nuevo.",
      "de": "Überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut.",
      "it": "Verifica la tua connessione internet e riprova.",
      "ru": "Проверьте ваше интернет-соединение и повторите попытку.",
      "zh": "检查您的互联网连接，然后重试。",
    },
    "lightning_email": {
      "en": "Lightning adress",
      "fr": "Adresse mail",
      "es": "Dirección de correo electrónico",
      "de": "E-Mail-Adresse eingeben",
      "it": "Inserisci il tuo indirizzo email",
      "ru": "Введите ваш адрес электронной почты",
      "zh": "输入您的电子邮件地址",
    },
    "my_nickname": {
      "en": "Nickname",
      "fr": "Pseudo",
      "es": "Apodo",
      "de": "Spitzname",
      "it": "Soprannome",
      "ru": "Псевдоним",
      "zh": "昵称",
    },
    "update_profile": {
      "en": "Update Profile",
      "fr": "Mettre à jour le profil",
      "es": "Actualizar perfil",
      "de": "Profil aktualisieren",
      "it": "Aggiorna profilo",
      "ru": "Обновить профиль",
      "zh": "更新个人资料",
    },
    "change_avatar": {
      "en": "CHANGE AVATAR",
      "fr": "CHANGER D'AVATAR",
      "es": "CAMBIAR AVATAR",
      "de": "AVATAR ÄNDERN",
      "it": "CAMBIA AVATAR",
      "ru": "ИЗМЕНИТЬ АВАТАР",
      "zh": "更改头像",
    },

    "log_out": {
      "en": "Log Out",
      "fr": "Déconnexion",
      "es": "Cerrar sesión",
      "de": "Abmelden",
      "it": "Esci",
      "ru": "Выйти",
      "zh": "退出",
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
