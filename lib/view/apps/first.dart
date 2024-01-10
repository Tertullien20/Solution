import 'package:flutter/material.dart';
import 'package:solution/view/apps/auth/login.dart';
import 'package:solution/view/apps/define_language.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:solution/view/widgets/text.dart';


class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'imgs/splash_screen.jpg',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DefineLanguage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 150.0),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(color: tertiary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              const Icon(FontAwesomeIcons.earthAfrica, color: white),
                              space(w: 10.0),
                              boldText("English", color: white)
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Image.asset(
                                "imgs/flag/flag_english.png",
                                width: 20.0,
                                height: 20.0,
                              ),
                              space(w: 10.0),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                color: white,
                                size: 25.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: button('GET STARTED'),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginView()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: button("ALREADY HAVE AN ACCOUNT?",
                        bgColor: transparent, borderColor: white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
