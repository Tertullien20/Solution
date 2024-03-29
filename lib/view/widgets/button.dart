import 'text.dart';
import 'loader.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

TextButton button(label,
    {bool loading = false, onTap, Color colorLoader = primary, width, Color bgColor = secondary, Color borderColor = secondary}) {
  return TextButton(
    style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(color: borderColor)),
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(color: borderColor)))),
    onPressed: onTap,
    child: Container(
      width: width,
      height: 35,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Center(
        child: loading ? loader(color: colorLoader) : boldText(label, color: white) ,
      ),
    ),
  );
}

textButton(String label, onPressed, {size}) {
  return   TextButton(
      onPressed: onPressed,
      child: text(label,
          size: size, color: primary));
}