class Validators {
  static RegExp alphaNum =
      RegExp(r'\b(?:\d+[A-Za-z]|[A-Za-z]+\d)[a-zA-Z0-9]*\b');
  static RegExp barcodeRex = RegExp(r'^(\d{4}|)[a-zA-Z\\^]{2,}\d{4,}$');
  static RegExp barcodeDigitsRegex = RegExp(r'^(\d{4}-|)\d{9}$');

  static String? validAlphaNum(String value) {
    if (value.isEmpty) return "Please enter code";
    bool isAlpha = alphaNum.hasMatch(value);
    if (!isAlpha) return "Enter valid code!";
    return null;
  }

  static String? validatePassword(value) => value!.isEmpty
      ? "Password can not be empty"
      : value.length < 8
          ? "Password should be at least 8 digits long"
          : !(RegExp(r'^(?=.*\d)').hasMatch(value))
              ? "Password must conatain at least 1 digit,"
              : null;

  static String? validateConfirmPassword(
          String password, String confirmPassword) =>
      confirmPassword.isEmpty
          ? "Confirm Password can not be empty"
          : password != confirmPassword
              ? "Confirm Password does not match"
              : null;

  static String? validatePhoneNumber(value) => value!.isEmpty
      ? "Phone number can not be empty"
      : value.length != 11 || !RegExp(r'(^03[0-9]{9}$)').hasMatch(value)
          ? "Invalid Phone number"
          : null;
}
