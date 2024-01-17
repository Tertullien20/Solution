import 'package:flutter/material.dart';
import 'package:solution/view/apps/profile/update_profile.dart';
import '../../widgets/text.dart';

class MyProfileAppBar extends StatelessWidget {
  const MyProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 2.0,
      centerTitle: true,
      background: Image.asset(
        'imgs/back_rect.png',
        fit: BoxFit.cover,
        height: 100,
      ),
      title: Stack(
        children: [
          // Your existing content (Go back and Edit buttons)
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
            right: 30.0,
            top: 40.0,
            child: Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProfile() ));
                    },
                    child: Image.asset('imgs/edit.png'),
                  ),
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
              child: CircleAvatar(
                backgroundImage: AssetImage('imgs/avatar.png'),
                radius: 50, // Adjust the size as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
