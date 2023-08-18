import 'package:flutterproject/constants/texts.dart';

class Validators {
  static final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final RegExp passwordRegExp = RegExp(r'^[A-Za-z0-9]{4,}$');
  static final RegExp addressRegExp = RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
  static final RegExp nameRegExp = RegExp(r'^[A-Za-z ]+$');
  static final RegExp numberRegExp = RegExp(r'^\d{9,12}$');
  static final RegExp otpRegExp = RegExp(r'^\d{4}$');

  static String? validate(String? text,
      {RegExp? regExp, String? msg, bool? allowEmpty = false}) {
    text = (text ?? '').trim();
    if (allowEmpty == false) {
      if (text.isEmpty) {
        return "${AppTexts.pleaseEnter} ${msg ?? AppTexts.something}";
      }

      if (regExp != null) {
        bool? hasMatch = regExp.hasMatch(text);
        if (hasMatch == false) {
          return "${AppTexts.enterValid} ${msg ?? AppTexts.value}";
        }
      }
    }
    return null;
  }

  static String? confirmPassword(String? confirmPass, String? pass) {
    confirmPass = (confirmPass ?? '').trim();
    pass = (pass ?? '').trim();

    String? valid = validate(confirmPass,
        msg: AppTexts.confirmPassword, regExp: Validators.passwordRegExp);

    if (valid != null && pass.isNotEmpty) return valid;

    if (pass == confirmPass) {
      return null;
    } else {
      return AppTexts.confirmPasswordNotMatch;
    }
  }
}
