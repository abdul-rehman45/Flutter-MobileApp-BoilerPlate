import 'package:flutter/material.dart';
import 'package:flutterproject/constant/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Helper {
  static TextStyle textStyle(
      {double fontSize = 12, Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.inter(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static BorderRadius borderRadius({double radius = 8}) {
    return BorderRadius.circular(radius.sp);
  }

  static BorderRadius appBarRadius({double radius = 12}) {
    return BorderRadius.vertical(
      bottom: Radius.circular(radius),
    );
  }

  static Border border({double width = 1, Color? color}) {
    return Border.all(width: width, color: color ?? primary);
  }

  static BorderSide borderSide({double width = 1, Color? color}) {
    return BorderSide(width: width, color: color ?? tfBorder);
  }

  static List<BoxShadow> boxShadow({double blur = 5}) {
    return [
      BoxShadow(
        color: black.withOpacity(0.01),
        offset: Offset(1.sp, 1.sp),
        spreadRadius: 1.sp,
        blurRadius: blur.sp,
      ),
      BoxShadow(
        color: black.withOpacity(0.01),
        offset: Offset(-1.sp, -1.sp),
        spreadRadius: 1.sp,
        blurRadius: blur.sp,
      ),
    ];
  }
}
