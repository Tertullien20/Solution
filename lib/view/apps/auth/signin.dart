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

import 'insert_nick_name.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  int selectedOptionIndex = -1;
  bool rememberMe = false, _obscurePass = true;

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
                          AppLocalizations(context).translate("enter_address"),
                          color: white,
                          size: 30.0,
                          align: TextAlign.start),
                    ],
                  ),
                  space(h: 20.0),
                  buildInput("Enter your lightning address", mailController,
                      TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        "imgs/vector.png",
                        width: 30.0,
                        height: 30.0,
                        color: Colors.yellow,
                      ),
                      validators: [empty, email],
                      maxLines: 1),
                  buildInput(
                      "Password", passController, TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {
                                _obscurePass = !_obscurePass;
                              }),
                          icon: Icon(
                              _obscurePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: greySample)),
                      obscureText: _obscurePass,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.lock_outline, color: white),
                      ),
                      validators: [empty, minLength]),
                  buildInput("Confirm Password", confirmPassController,
                      TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {
                                _obscurePass = !_obscurePass;
                              }),
                          icon: Icon(
                              _obscurePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: greySample)),
                      obscureText: _obscurePass,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.lock_outline, color: white),
                      ),
                      validators: [empty, minLength]),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: button("CONTINUE", bgColor: primary, onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InsertNickName()));
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
