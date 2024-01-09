import 'package:flutter/material.dart';

Text text (label, {size = 18.0, weight, color, decoration, fontFamily = "Baloo2Medium", align= TextAlign.center, overflow= TextOverflow.visible, maxLines}){
  return Text(label, style: TextStyle(fontWeight: weight, fontSize: size,color: color, decoration: decoration, fontFamily:fontFamily), textAlign: align, overflow: overflow, maxLines: maxLines,);
}

Text boldText (label, {size = 18.0, weight, color, decoration, fontFamily = "Baloo2Bold", align= TextAlign.center, overflow= TextOverflow.visible}){
  return Text(label, style: TextStyle(fontWeight: weight, fontSize: size,color: color, decoration: decoration, fontFamily:fontFamily), textAlign: align, overflow: overflow,);
}