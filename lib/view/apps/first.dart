import 'package:flutter/material.dart';
import 'package:solution/view/apps/define_language.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';

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
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DefineLanguage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 150.0),
                    child: button('English', bgColor: tertiary, borderColor: transparent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: button('GET STARTED'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                  child: button("ALREADY HAVE AN ACCOUNT?",
                      bgColor: transparent, borderColor: white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
