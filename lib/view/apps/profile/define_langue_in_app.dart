import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../provider/language/app_localizations.dart';
import '../../../provider/language/language_provider.dart';
import '../../widgets/space.dart';
import '../../widgets/text.dart';

class DefineLanguageInApp extends StatefulWidget {
  const DefineLanguageInApp({super.key});

  @override
  State<DefineLanguageInApp> createState() => _DefineLanguageInAppState();
}

class _DefineLanguageInAppState extends State<DefineLanguageInApp> {
  final controller = TextEditingController();
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: Column(
        children: [
          Container(
            color: secondary,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  const Icon(FontAwesomeIcons.arrowLeft, color: white),
                  const SizedBox(width: 10),
                  text(AppLocalizations(context).translate("back"), color: white)

                ]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      boldText(
                          AppLocalizations(context)
                              .translate("what_your_language"),
                          color: white,
                          size: 30.0,
                          align: TextAlign.start),
                    ],
                  ),
                  space(h: 10.0),
                  Row(
                    children: [
                      text(AppLocalizations(context).translate("select_lang"),
                          color: white, size: 16.0),
                    ],
                  ),
                  space(h: 20.0),
                  itemLanguage("imgs/flag/flag_english.png",
                      "United Kingdom (British)", 0, const Locale("en", "US")),
                  itemLanguage("imgs/flag/flag_spanish.png",
                      "Spanish (Español)", 1, const Locale("es", "ES")),
                  itemLanguage("imgs/flag/flag_french.png", "France (France)",
                      2, const Locale("fr", "FR")),

                  itemLanguage("imgs/flag/italian.jfif", "Italian",
                      3, const Locale("it", "IT")),
                  itemLanguage("imgs/flag/russian.jfif", "Russian",
                      4, const Locale("ru", "RU")),
                  itemLanguage("imgs/flag/chinese.jfif", "Chinese",
                      5, const Locale("zh", "ZH")),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: button(AppLocalizations(context).translate("confirm"), bgColor: primary, onTap: () {
             Navigator.pop(context);
            }),
          )
        ],
      ),
    );
  }

  Widget itemLanguage(path, label, index, locale) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOptionIndex = index;
          context.read<LanguageProvider>().changeLanguage(locale);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: selectedOptionIndex == index ? white : grey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                path,
                width: 30.0,
                height: 30.0,
              ),
              space(w: 10.0),
              text(label, color: white)
            ],
          ),
        ),
      ),
    );
  }
}
