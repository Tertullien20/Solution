import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../provider/language/app_localizations.dart';
import '../../../utils/validators/email.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final mailController = TextEditingController();
  String responseValue = '';
  bool _loading = false;

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
                      boldText(AppLocalizations(context).translate("enter_mail"),
                          color: white, size: 30.0, align: TextAlign.start),
                    ],
                  ),
                  space(h: 20.0),
                  buildInput(AppLocalizations(context).translate("enter_mail"), mailController,
                      TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        "imgs/vector.png",
                        width: 30.0,
                        height: 30.0,
                        color: yellow,
                      ),
                      maxLines: 1),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: button("RECEIVE MAIL",
                        bgColor: primary,
                        loading: _loading,
                        colorLoader: white, onTap: () async {
                      if(mailController.text.isNotEmpty){
                        String? emailValidationResult = validMail(mailController.text);

                        if (emailValidationResult != null) {
                          setState(() {
                            responseValue = emailValidationResult;
                          });
                        }else {
                          resetPassword(mailController.text, context);
                        }
                      } else {
                        responseValue = 'Renseignez votre mail';
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text(responseValue, color: red, align: TextAlign.start, overflow: TextOverflow.visible),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
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

  resetPassword(email, context) async {
    setState(() {
      responseValue = '';
      _loading = true;
    });
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
          showSnackBar(AppLocalizations(context).translate("recovery_email_sent")));
    } on FirebaseAuthException catch (e) {
      print(e);
      if(e.toString() == "[firebase_auth/invalid-email] The email address is badly formatted."){
        setState(() {
          responseValue = "Adresse mail invalide"; //AppLocalizations(context).translate("invalid_email");
        });
      }
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            showSnackBar(AppLocalizations(context).translate("user_not_found_for_email")));
      }
    }
    setState(() {
      _loading = false;
    });
  }
}
