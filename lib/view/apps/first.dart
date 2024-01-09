import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';

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
          // Image de fond
          Image.asset(
            'imgs/splash_screen.jpg',
            fit: BoxFit.cover,
          ),

           Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: button('GET STARTED'),
               )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
