import 'package:solution/view/widgets/button.dart';

import '../widgets/space.dart';
import '../widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefineLanguage extends StatefulWidget {
  const DefineLanguage({super.key});

  @override
  State<DefineLanguage> createState() => _DefineLanguageState();
}

class _DefineLanguageState extends State<DefineLanguage> {
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
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  const Icon(FontAwesomeIcons.arrowLeft, color: white),const SizedBox(width: 10) , text("Back", color: white)
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
                      boldText("What is your \nlanguage?", color: white, size: 32.0, align: TextAlign.start),
                    ],
                  ),
                  space(h: 10.0),
                  Row(
                    children: [
                      text("Select a language to get started.", color: white, size: 16.0),
                    ],
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
         Padding(
           padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
           child: button("CONFIRM", bgColor: primary),
         )
        ],
      ),
    );
  }
}