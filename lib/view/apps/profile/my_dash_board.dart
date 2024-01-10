import 'package:flutter/material.dart';

class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
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
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
             Row(
               children: [

               ],
             )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
