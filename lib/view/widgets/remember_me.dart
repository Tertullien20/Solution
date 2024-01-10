import 'text.dart';
import 'space.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

Widget rememberMeCheckbox(bool value, Function(bool?) onChanged) {
  return InkWell(
    onTap: () {
      onChanged(!value);
    },
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: white),
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: value
                ? const Icon(
              Icons.check,
              size: 12.0,
              color: white,
            )
                : space(h: 12.0, w: 12.0),
          ),
        ),
        space(w: 8.0),
        text("Remember Me", color: white, size: 16.0),
      ],
    ),
  );
}

