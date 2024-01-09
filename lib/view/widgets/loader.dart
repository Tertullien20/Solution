import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loader({Color color = primary, double size = 12.0}) {
  return LoadingAnimationWidget.beat(color: color, size: size);
}