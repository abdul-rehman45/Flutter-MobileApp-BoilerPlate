import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFAE1F25);
  //Color(0xFFF75353);
  static const Color bgColor = Color(0xFFFAFAFA);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF262626);
  static const Color green = Color(0xFF5CB85C);
  static const Color scaffold = Color(0xFFFAFAFA);
  static const Color grey = Color(0xFF7A7A7A);
  static const Color lightgrey = Color(0xFFE9E9E9);

  static const Color whiteShade = Color(0xFFF7F7F7);

  // text field colors
  static const Color tfBorder = Color(0xFF939393);
  static const Color tfbgFillColor = Colors.white;
  static const Color searchFillColor = Color(0xFFE8EBF2);

  //Color(0xFFB6B6B6);
  static const Color tfTextHintColor = Color(0xFFB6B6B6);
  static const Color tfTextColor = Color(0xFFB6B6B6);

  // text colors
  static const Color text = Color(0xFF575757);

  static const Color textLightGrey = Color(0xFF575757);

  // Card colors
  static const Color lightYellow = Color(0xFFF7F3E2);
  static const Color yellow = Color(0xFFFFFCB5);

  static const Color lightRed = Color(0xFFFF7F7F);
  static const Color chip = Color(0xFFF2F2F2);
  static const Color type = Color(0xFFF0F3FC);

  static const MaterialColor colorPallete = MaterialColor(
    0xFFF75353, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFF75353), //10%
      100: Color(0xFFF75353), //20%
      200: Color(0xFFF75353), //30%
      300: Color(0xFFF75353), //40%
      400: Color(0xFFF75353), //50%
      500: Color(0xFFF75353), //60%
      600: Color(0xFFF75353), //70%
      700: Color(0xFFF75353), //80%
      800: Color(0xFFF75353), //90%
      900: Color(0xFFF75353), //100%
    },
  );
}
