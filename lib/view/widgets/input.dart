import 'package:flutter/material.dart';
import 'package:solution/utils/constants/colors.dart';

Widget input(TextEditingController controller,
    {decoration,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    List<String? Function(String?)>? validators,
    int? maxLines,
    onChanged,
    bool enabled = true,
    colorBorder = secondary, colorFont}) {
  return Container(
      decoration: BoxDecoration(
        color: colorFont,
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: colorBorder, width: 2.0),
      ),
      child: TextFormField(
        enabled: enabled,
        decoration: decoration,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(color: white),
        validator: (val) {
          if (validators != null) {
            for (var e in validators) {
              final res = e(val);
              if (res != null) return res;
            }
          }
          return null;
        },
        onChanged: onChanged,
        maxLines: obscureText ? 1 : maxLines,
      ));
}

InputDecoration textFieldDecoration(String hintText,
    {String labelText = "",
    String? errorText,
    bool filled = true,
    Widget? prefixIcon,
    Widget? suffixIcon}) {
  if (labelText == "") {
    labelText = hintText;
  }
  return InputDecoration(
      labelText: labelText,
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(),
      disabledBorder: InputBorder.none,
      fillColor: Colors.grey,
      filled: filled,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
      enabledBorder: textFieldBorder(),
      focusedBorder: textFieldBorder(),
      errorText: errorText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      floatingLabelBehavior: FloatingLabelBehavior.never);
}

InputBorder textFieldBorder() {
  return const OutlineInputBorder(
      borderSide: BorderSide(width: 2.0, color: transparent),
      borderRadius: BorderRadius.all(Radius.circular(8.0)));
}
