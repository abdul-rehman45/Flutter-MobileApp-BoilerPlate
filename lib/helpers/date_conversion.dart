import 'package:intl/intl.dart';

class dateHelper {
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
