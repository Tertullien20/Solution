import 'package:flutter/material.dart';
import 'package:solution/view/apps/first.dart';
import 'package:solution/view/apps/profile/my_dash_board.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  User? userT= FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return userT != null ?  const MyDashBoard() : const FirstView();
  }
}