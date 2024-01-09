import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/provider/language/app_localizations.dart';
import '../../controller/provider/language/language_provider.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();

  const Splash({super.key});
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // Obtain the current locale from the LanguageProvider
    Locale currentLocale = context.watch<LanguageProvider>().locale;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations(context).translate("hello_text"),
              style: TextStyle(fontSize: 18),
            ),
            Text(
              AppLocalizations(context).translate("welcome_message"),
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                // Show a language selection dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Change Language"),
                      content: DropdownButton<Locale>(
                        value: currentLocale,
                        onChanged: (Locale? locale) {
                          if (locale != null) {
                            // Vérifiez que 'locale' est une des options valides dans votre menu déroulant
                            context.read<LanguageProvider>().changeLanguage(locale);
                            Navigator.pop(context);
                          }
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text("English"),
                            value: Locale("en", "US"),
                          ),
                          DropdownMenuItem(
                            child: Text("Français"),
                            value: Locale("fr", "FR"),
                          ),
                          DropdownMenuItem(
                            child: Text("Español"),
                            value: Locale("es", "ES"),
                          ),
                          DropdownMenuItem(
                            child: Text("Allemand"),
                            value: Locale("de", "DE"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("Change Language"),
            ),
          ],
        ),
      ),
    );
  }
}
