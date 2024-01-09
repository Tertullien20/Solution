import 'package:flutter/material.dart';
import 'package:solution/utils/constants/colors.dart';


Widget input(TextEditingController controller, {decoration, bool obscureText = false, TextInputType keyboardType = TextInputType.text, List<String? Function(String?)>? validators, int? maxLines, onChanged, bool enabled = true, colorBorder = secondary }) {
  return
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color: colorBorder,
          ),
        ),
        child:  TextFormField(
          enabled: enabled,
          decoration:decoration,
          obscureText: obscureText,
          keyboardType: keyboardType,
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
      Color colorHint = white,
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
      fillColor: white,
      filled: filled,
      hintText: hintText,
      hintStyle: TextStyle(color: colorHint),
      enabledBorder: textFieldBorder(),
      focusedBorder: textFieldBorder(),
      errorText: errorText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      floatingLabelBehavior: FloatingLabelBehavior.never);
}

InputBorder textFieldBorder() {
  return const OutlineInputBorder(
     borderSide: BorderSide(width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)));
}