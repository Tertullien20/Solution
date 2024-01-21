import 'package:flutter/material.dart';
import '../../widgets/text.dart';

class MyProfileAppBarUpdate extends StatelessWidget {
  const MyProfileAppBarUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 2.0,
      centerTitle: true,
      title: Stack(
        children: [
          Positioned(
            left: 30.0,
            top: 40.0,
            child: Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('imgs/left.png'),
                  ),
                  text("Go back"),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container( 
              alignment: Alignment.center,
              child: const CircleAvatar(
                backgroundImage: AssetImage('imgs/avatar.png'),
                radius: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
