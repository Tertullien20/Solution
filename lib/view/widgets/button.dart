import '../../utils/constants/colors.dart';
import 'loader.dart';
import 'text.dart';
import 'package:flutter/material.dart';

TextButton button(label,
    {bool loading = false, onTap, Color colorLoader = primary, width}) {
  return TextButton(
    style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(color: white)),
        backgroundColor: MaterialStateProperty.all(white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
                side: const BorderSide(color: secondary)))),
    onPressed: onTap,
    child: Container(
      width: width,
      height: 35,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Center(
        child: loading ? loader(color: colorLoader) : text(label, color: white) ,
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