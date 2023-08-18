import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';
import '../constants/globals.dart';

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
    return Border.all(width: width, color: color ?? AppColors.primary);
  }

  static BorderSide borderSide({double width = 1, Color? color}) {
    return BorderSide(width: width, color: color ?? AppColors.tfBorder);
  }

  static List<BoxShadow> boxShadow({double blur = 5}) {
    return [
      BoxShadow(
        color: AppColors.black.withOpacity(0.01),
        offset: Offset(1.sp, 1.sp),
        spreadRadius: 1.sp,
        blurRadius: blur.sp,
      ),
      BoxShadow(
        color: AppColors.black.withOpacity(0.01),
        offset: Offset(-1.sp, -1.sp),
        spreadRadius: 1.sp,
        blurRadius: blur.sp,
      ),
    ];
  }
}

class DateHelper {
  static String? formatDateTime(String? dateTime) {
    DateFormat formatter = DateFormat.MEd();
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatToDayAndDateFormat(String? dateTime) {
    DateFormat formatter = DateFormat.EEEE();
    DateFormat dateFormat = DateFormat('dd/MM/yy');

    if (dateTime != null) {
      return "${formatter.format(DateTime.parse(dateTime)).toString()} ${dateFormat.format(DateTime.parse(dateTime))}";
    }
    return null;
  }

  static String? formatTime(String? dateTime) {
    DateFormat formatter = DateFormat.jm();

    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatIntoCompleteDate(String? dateTime) {
    DateFormat formatter = DateFormat('dd/MM/yy');
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatIntoMonthYear(String? dateTime) {
    DateFormat formatter = DateFormat.yMMMMd('en_US');
    //DateFormat('M,dd,yyyy');
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatDateTimeINYear(String? dateTime) {
    DateFormat formatter = DateFormat.yM();
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime)).toString();
    }
    return null;
  }

  static String? formatDateTimeINYearDayMonth(String? dateTime) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    if (dateTime != null) {
      return formatter.format(DateTime.parse(dateTime.toString())).toString();
    }
    return null;
  }

  static DateTime convertToDateTime(String? date) {
    DateTime dateTime;
    if (date != null) {
      dateTime = DateTime.parse(date);
    } else {
      dateTime = DateTime.now();
    }
    return dateTime;
  }

  static bool checkValidity(String? validTill) {
    DateTime validTillDate = convertToDateTime(validTill);
    DateTime now = DateTime.now();

    bool isValid = validTillDate.isAfter(now);
    return isValid;
  }
}

appLogs(String message) {
  log("${AppGlobals.appName}: $message");
}
