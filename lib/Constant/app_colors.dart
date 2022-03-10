import 'package:flutter/material.dart';

class AppColors {
  static Color lightGreen = Color(0xFF45E3D5);
  static Color tfBorder = Color(0xFFCAE6FD);
  static Color grey = Color(0xFF787878);
  static Color black = Color(0xFF383838);
  static Color white = Color(0xFFFFFFFF);

  static Color lightBlue = Color(0xFFCAE6FD);
  static Color bgColor = Color(0xFFF9FCFF);
  static Color graphBg = Color(0xFFEBF6FF);
  static Color dialogColor = white;
  static Color textColor = Color(0xFF383838);
  static Color greyTextColor = Color(0xFF656565);
  static Color g2Color = Color(0xFF00CAE8);
  static Color g3Color = Color(0xFF00ACF1);
  static Color g4Color = Color(0xFF4689E4);
  static Color g5Color = Color(0xFF8760BD);
  static Color g6Color = Color(0xFFA22F80);
  static Color iconBgColor = Color(0xFFA9D9FF);
  static Color shadowColor = Color(0xFF005190);
  static Color onlineColor = Color(0xFF65E345);
  static Color oflineColor = Color(0xFFBDBDBD);
  static Color messageBg = Color(0xFFE8F5FF);
  static Color red = Color(0xFFD62D30);
  static Color orange = Color(0xFFF8981D);
  static Color barColor = iconBgColor;
  static Color monthsBg = white;
  // static Color itemDetailBg = Color(0xFFC4C4C4);

  static setThemeColor(bool isDark) {
    // print("isdark ......$isDark");
    bgColor = isDark ? Color(0xFF1E2429) : Color(0xFFF9FCFF);
    textColor = isDark ? white : Color(0xFF383838);
    dialogColor = isDark ? Color(0xFF2F353A) : white;
    iconBgColor = isDark ? dialogColor : Color(0xFFA9D9FF);
    greyTextColor = isDark ? white : Color(0xFF656565);
    shadowColor = isDark ? Color(0xFF252C32) : Color(0xFF005190);
    messageBg = isDark ? Color(0xFF2F353A) : Color(0xFFE8F5FF);
    graphBg = isDark ? Color(0xFF2D3338) : Color(0xFFEBF6FF);
    barColor = isDark ? Color(0xFF434A50) : Color(0xFFA9D9FF);
    monthsBg = isDark ? Color(0xFF434A50) : white;
    // itemDetailBg = isDark ? Color(0xFF2D3338) : Color(0xFFF9FCFF);
  }
}
