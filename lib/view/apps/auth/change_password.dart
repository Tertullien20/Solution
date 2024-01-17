import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool _obscurePass = true;
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
                      boldText('Update your password',
                          color: white, size: 30.0, align: TextAlign.start),
                    ],
                  ),
                  space(h: 20.0),
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
                      prefixIcon:  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.lock_outline, color:  passController.text.isNotEmpty ?  white: grey92),
                      ),),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: button("CONFIRM", bgColor: primary, loading: _loading, colorLoader: white, onTap: () async{
                      //updateMail(mailController.text);
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