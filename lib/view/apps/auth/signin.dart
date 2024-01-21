import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import '../../../utils/validators/email.dart';
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
                  text(AppLocalizations(context).translate("previous"), color: white)
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
                  buildInput(AppLocalizations(context).translate("enter_mail"), mailController,
                      TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        "imgs/vector.png",
                        width: 30.0,
                        height: 30.0,
                        color: yellow,
                      ),
                      maxLines: 1),
                  buildInput(
                    AppLocalizations(context).translate("password"), passController, TextInputType.visiblePassword,
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
                      prefixIcon:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.lock_outline, color:  passController.text.isNotEmpty ?  white: grey92),
                      ),),
                  buildInput(AppLocalizations(context).translate("confirm_password"), confirmPassController,
                      TextInputType.visiblePassword,
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {
                                _obscurePass = !_obscurePass;
                              }),
                          icon: Icon(
                              _obscurePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: grey92)),
                      obscureText: _obscurePass,
                      prefixIcon:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.lock_outline, color:  confirmPassController.text.isNotEmpty ?  white: grey92),
                      ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text(responseValue, color: red, align: TextAlign.start, overflow: TextOverflow.visible),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: button(AppLocalizations(context).translate("continue"), bgColor: primary, loading: _loading, colorLoader: white, onTap: () {
              if(mailController.text.isNotEmpty && passController.text.isNotEmpty && confirmPassController.text.isNotEmpty){
                String? emailValidationResult = validMail(mailController.text);

                if (emailValidationResult != null) {
                  setState(() {
                    responseValue = emailValidationResult;
                  });
                } else {
                  if(passController.text == confirmPassController.text){
                    if(passController.text.length > 6){
                      setState(() {
                        responseValue = '';
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InsertNickName(emailAdress:  mailController.text, password:passController.text)));
                    } else{
                      setState(() {
                        responseValue = "Minimum 6 caractères"; //AppLocalizations(context).translate("min_characters");
                      });
                    }
               } else {
                    setState(() {
                      responseValue = "Les mots de passe ne correspondent pas";// AppLocalizations(context).translate("password_mismatch");
                    });
                  }
              }
              }else {
                setState(() {
                  responseValue = "All fields are required.";// AppLocalizations(context).translate("allfields");
                });

              }
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
