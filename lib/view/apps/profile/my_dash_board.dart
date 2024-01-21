import 'package:solution/view/apps/profile/my_account.dart';

import '../../widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyDashBoard extends StatefulWidget {
  const MyDashBoard({super.key});

  @override
  State<MyDashBoard> createState() => _MyDashBoardState();
}

class _MyDashBoardState extends State<MyDashBoard> {
  User? userT= FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        children: [
          space(h: 60.0),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    _itemMenu("imgs/menu/earnsat.png", "Earn SATs", (){
                    }),
                    _itemMenu("imgs/menu/leader.png", "Leaderboard", (){
                    }),
                    _itemMenu("imgs/menu/profile.png", "Profile", (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Profile()));
                    })
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  _itemMenu(path, label, onTap){
    return   InkWell(
      focusColor: transparent,
      highlightColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              path,
              width: 60.0,
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: text(label, color: white, size: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
