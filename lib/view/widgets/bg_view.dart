import 'package:flutter/material.dart';

Widget bgView({child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('imgs/splash_screen.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: child,
  );
}