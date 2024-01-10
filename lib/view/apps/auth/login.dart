import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import '../../widgets/text.dart';
import '../../../provider/language/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final mailController = TextEditingController();
  final passController = TextEditingController();

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
                      boldText(AppLocalizations(context).translate("welcome_back"),
                          color: white, size: 32.0, align: TextAlign.start),
                    ],
                  ),
                  buildInput("Enter your lightning address",mailController, TextInputType.emailAddress, prefixIcon: Image.asset(
                    "imgs/vector.png",
                    width: 30.0,
                    height: 30.0,
                  )),
                  buildInput("Password",passController, TextInputType.visiblePassword, suffixIcon: const Icon(Icons.remove_red_eye, color: grey), obscureText: true, prefixIcon: const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Icon(Icons.lock_outline, color: white),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: button("SIGN IN", bgColor: primary, onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LoginView()));
                    }),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
            child: text( AppLocalizations(context).translate("have_account"), color: white),
          )
        ],
      ),
    );
  }

  Widget buildInput(String text, controller, keyboardType, {suffixIcon, bool obscureText = false, prefixIcon}) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: input(controller,
          obscureText: obscureText ,
          keyboardType: keyboardType ,
          colorBorder: primary, colorFont: fillGrey,
          decoration: textFieldDecoration(text, prefixIcon: prefixIcon , filled: false, suffixIcon: suffixIcon)),
    );
  }
}