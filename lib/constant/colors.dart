import 'package:flutter/material.dart';

const Color primary = Color(0xFFAE1F25);
const Color scaffold = Color(0xFFFAFAFA);
const Color bgColor = Color(0xFFFAFAFA);

// text & textfield colors
const Color text = Color(0xFF575757);
const Color textLightGrey = Color(0xFF575757);
const Color tfBorder = Color(0xFF939393);
const Color tfbgFillColor = Colors.white;
const Color tfTextHintColor = Color(0xFFB6B6B6);
const Color tfTextColor = Color(0xFFB6B6B6);

// Colors
const Color white = Color(0xFFFFFFFF);
const Color black = Color(0xFF262626);
const Color green = Color(0xFF5CB85C);

const Color grey = Color(0xFF7A7A7A);
const Color lightgrey = Color(0xFFE9E9E9);
const Color whiteShade = Color(0xFFF7F7F7);

//                   Theme Color
const MaterialColor colorPallete = MaterialColor(
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
