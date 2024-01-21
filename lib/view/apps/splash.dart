import 'package:flutter/material.dart';
import 'package:solution/view/apps/first.dart';

import '../widgets/bg_view.dart';
import 'auth/wrapper.dart';

class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();

  const Splash({super.key});
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 3),
            ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => const Wrapper()), (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgView()
    );
  }
}
