import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import '../../../utils/validators/email.dart';
import '../../../utils/validators/empty.dart';
import '../../../utils/validators/min_length.dart';
import '../../widgets/text.dart';
import '../../../provider/language/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InsertNickName extends StatefulWidget {
  const InsertNickName({super.key});

  @override
  State<InsertNickName> createState() => _InsertNickNameState();
}

class _InsertNickNameState extends State<InsertNickName> {
  final nickNameController = TextEditingController();

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
                  space(w: 10.0),
                  text("Previous", color: white)
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
                          AppLocalizations(context).translate("your_nickname"),
                          color: white,
                          size: 30.0,
                          align: TextAlign.start),
                    ],
                  ),
                  space(h: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: text(
                            AppLocalizations(context).translate("see_name"),
                            color: white,
                            size: 16.0,
                            align: TextAlign.start),
                      ),
                    ],
                  ),
                  space(h: 20.0),
                  buildInput("NickName", nickNameController, TextInputType.text,
                      validators: [empty],
                      maxLines: 1,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              nickNameController.clear();
                            });
                          },
                          icon: const Icon(FontAwesomeIcons.xmark,
                              color: greySample))),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: button("SIGN IN", bgColor: primary, onTap: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InsetNickName()));*/
            }),
          )
        ],
      ),
    );
  }

  Widget buildInput(String text, controller, keyboardType,
      {suffixIcon,
      bool obscureText = false,
      prefixIcon,
      validators,
      maxLines}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: input(controller,
          maxLines: maxLines,
          obscureText: obscureText,
          keyboardType: keyboardType,
          colorBorder: primary,
          colorFont: fillGrey,
          decoration: textFieldDecoration(text,
              prefixIcon: prefixIcon, filled: false, suffixIcon: suffixIcon),
          validators: validators),
    );
  }
}
