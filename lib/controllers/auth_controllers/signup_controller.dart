import 'package:flutter/cupertino.dart';
import 'package:flutterproject/backend/models/auth/user_model.dart';
import 'package:flutterproject/constants/globals.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:get/get.dart';
import '../../Widgets/inputFields.dart/custom_inputfields.dart';
import '../../backend/apis/apis.dart';
import '../../constants/url.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController tfEmail = TextEditingController();
  TextEditingController tfPassword = TextEditingController();
  TextEditingController tfConfirmPassword = TextEditingController();
  TextEditingController tfFirstName = TextEditingController();
  TextEditingController tfLastName = TextEditingController();
  Future<void> onSignUp() async {
    if (formkey.currentState!.validate()) {
      String firstName = tfFirstName.text.trim();
      String lastName = tfLastName.text.trim();
      String email = tfEmail.text.trim().toLowerCase();
      String password = tfPassword.text.trim();
      CustomTextField.unFocus();
      try {
        var response = await api(RestMethods.POST, AppUrls.baseUrl,
            data: {
              "firstName": firstName,
              "lastName": lastName,
              "email": email,
              "password": password,
              "confirmPassword": password
            },
            showLoader: true,
            showToast: true,
            showSuccessMessage: true,
            isJson: true);
        if (response != null) {
          UserModel userModel = UserModel.fromJson(response);
          AppGlobals.user = userModel;
          tfEmail.clear();
          tfPassword.clear();
          tfFirstName.clear();
          tfLastName.clear();
          //   Get.to(() => const RoleSelectionPage());
        }
      } catch (err) {
        appLogs("SignUp Error: $err");
      }
    }
  }
}
