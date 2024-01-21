import 'package:flutter/material.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/view/widgets/input.dart';

import '../../widgets/space.dart';
import '../../widgets/text.dart';
import 'app_bar_profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final nickNameController = TextEditingController();
  final emailController = TextEditingController();
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
                padding: const EdgeInsets.all(15.0),
                child: Row(children: [
                  const Icon(FontAwesomeIcons.arrowLeft, color: white),
                  space(w: 10.0),
                  text(" Go Back", color: white)
                ]),
              ),
            ),
          ),
          Column(children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("imgs/avatar.png"),
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: button("CHANGE AVATAR", bgColor: green, width: 150.0),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text("Nickname", color: white),
                  space(h: 5.0),
                  buildInput("NickName", nickNameController, TextInputType.name),
                  space(h: 25.0),
                  text("Lightning Address", color: white),
                  space(h: 5.0),
                  buildInput("Lightning Address", emailController, TextInputType.emailAddress),
                  space(h: 25.0),
                  button("UPDATE PROFILE", bgColor: primary),
                ],
              ),
            )
          ],)
        ],
      ),

    );
  }

  Widget buildInput(String text, controller, keyboardType,
      {suffixIcon,
        maxLines}) {
    return input(controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        colorBorder: primary,
        colorFont: white,
        colorTxt: dark,
        decoration: textFieldDecoration(text, filled: false),
        );
  }
}
