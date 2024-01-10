import '../widgets/space.dart';
import '../widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'auth/login.dart';

class DefineLanguage extends StatefulWidget {
  const DefineLanguage({super.key});

  @override
  State<DefineLanguage> createState() => _DefineLanguageState();
}

class _DefineLanguageState extends State<DefineLanguage> {
  final controller = TextEditingController();

  int selectedOptionIndex = -1;

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
                  text("Back", color: white)
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
                      boldText("What is your \nlanguage?",
                          color: white, size: 32.0, align: TextAlign.start),
                    ],
                  ),
                  space(h: 10.0),
                  Row(
                    children: [
                      text("Select a language to get started.",
                          color: white, size: 16.0),
                    ],
                  ),
                  space(h: 20.0),
                  itemLanguage("imgs/flag_english.png",
                      "United Kingdom (British)", 0),
                  itemLanguage(
                      "imgs/flag_spanish.png", "Spanish (Español)", 1),
                  itemLanguage(
                      "imgs/flag_french.png", "France (France)", 2),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: button("CONFIRM", bgColor: primary, onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView()));
            }),
          )
        ],
      ),
    );
  }

  Widget itemLanguage(path, label, index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedOptionIndex = index;
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
