import 'package:flutter/material.dart';

class Utilities {
  static TextStyle setTextStyle(double fontSize,
          {FontWeight? fontWeight, Color? color}) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.white);
}
