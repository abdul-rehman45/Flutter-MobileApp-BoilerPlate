class Validator {
  String? validatePassword(String password) => password.trim().isEmpty
      ? 'Enter a Valid Password'
      : password.trim().length < 8
          ? 'Password must be 8 characters long'
          : null;

  String? validateEmail(String value) {
    Pattern pattern = r"^[\w-\.]+@([\w-]+\.)+[a-zA-Z]{2,4}$";
    RegExp regex = new RegExp(pattern as String);
    if (value.isEmpty) {
      return 'Enter email address';
    }
    if (!regex.hasMatch(value.trim()))
      return 'Enter a valid email address';
    else
      return null;
  }

  String? validatePhoneNumber(String code, String number) {
    // print("Numbber is " + number.toString());
    //phone number length 10 - 12 digits

    String value = "$code$number";
    String pattern =
        r'([+](?:[0-9] ?){10,12}[0-9]$)'; //r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (number.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch('$value')) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateConfirmPassword(String password, String confirmPassWord) {
    if (password != confirmPassWord) {
      return 'Password does not Match';
    } else
      return null;
  }
}
