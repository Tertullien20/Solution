import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import 'text.dart';

SnackBar showSnackBar(String label, {int seconds = 4}) {
  return SnackBar(
    content: text(label, color: tertiary, overflow: TextOverflow.visible),
    backgroundColor: Colors.white,
    margin: const EdgeInsets.all(40),
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: seconds),
  );
}