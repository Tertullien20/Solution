import 'package:flutter/material.dart';
import 'package:solution/view/apps/auth/login.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../provider/language/app_localizations.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeMail extends StatefulWidget {
  const ChangeMail({super.key});

  @override
  State<ChangeMail> createState() => _ChangeMailState();
}

class _ChangeMailState extends State<ChangeMail> {
  final mailController = TextEditingController();
  final mailConfirmController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

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
                      boldText('Change your lightning address',
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
                  space(h: 20.0),
                  buildInput("Confirm your lightning address",
                      mailConfirmController, TextInputType.emailAddress,
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
                    child: button("CONFIRM",
                        bgColor: primary,
                        loading: _loading,
                        colorLoader: white, onTap: () async {
                      updateMail(mailController.text, context);
                    }),
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

  updateMail(newEmail, context) async {
    setState(() {
      _loading = true;
    });
    try {
      await currentUser!.updateEmail(newEmail);
      FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
          "Votre email a été mis à jour, veillez vous reconnecter."));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
          (route) => false);
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
        ScaffoldMessenger.of(context)
            .showSnackBar(showSnackBar("Cette adresse mail est déjà pris."));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(showSnackBar(
            "Vous devez vous reconnecter pour effectuer cette opération"));
      }
    }
    setState(() {
      _loading = false;
    });
  }
}
