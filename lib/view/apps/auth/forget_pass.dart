import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import '../../../utils/validators/email.dart';
import '../../../utils/validators/empty.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                      boldText('Enter your lightning address',
                          color: white, size: 30.0, align: TextAlign.start),
                    ],
                  ),
                  space(h: 20.0),
                  buildInput("Enter your lightning address",mailController, TextInputType.emailAddress, prefixIcon: Image.asset(
                    "imgs/vector.png",
                    width: 30.0,
                    height: 30.0,
                    color: yellow,
                  ), maxLines: 1),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: button("RECEIVE MAIL", bgColor: primary, onTap: () async{
                      resetPassword(mailController.text);
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

  Widget buildInput(String text, controller, keyboardType, {suffixIcon, bool obscureText = false, prefixIcon, validators, maxLines}) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: input(controller,
          maxLines: maxLines,
          obscureText: obscureText ,
          keyboardType: keyboardType ,
          colorBorder: primary, colorFont: fillGrey,
          decoration: textFieldDecoration(text, prefixIcon: prefixIcon , filled: false, suffixIcon: suffixIcon), validators: validators),
    );
  }

  resetPassword(email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
      }
    }

  }
}