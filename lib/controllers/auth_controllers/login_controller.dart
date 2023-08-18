import 'package:flutter/cupertino.dart';
import 'package:flutterproject/backend/models/auth/user_model.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:flutterproject/helpers/storage_helper.dart';
import 'package:get/get.dart';
import '../../Widgets/inputFields.dart/custom_inputfields.dart';
import '../../backend/apis/apis.dart';
import '../../constants/globals.dart';
import '../../constants/url.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController tfEmail = TextEditingController();
  TextEditingController tfPassword = TextEditingController();

  Future<void> onLogin() async {
    try {
      if (formkey.currentState!.validate()) {
        String email = tfEmail.text.trim().toLowerCase();
        String password = tfPassword.text.trim();
        CustomTextField.unFocus();
        var response = await api(RestMethods.POST, AppUrls.baseUrl,
            data: {"email": email, "password": password},
            showLoader: true,
            showToast: true,
            showSuccessMessage: true,
            isJson: true);
        if (response != null) {
          tfEmail.clear();
          tfPassword.clear();
          UserModel userModel = UserModel.fromJson(response);
          AppGlobals.user = userModel;
          StorageHelper.saveVariable(AppKeys.user, userModel.toJson());
          if (userModel.user?.role == null || userModel.user?.role == "") {
            //Get.offAll(() => const RoleSelectionPage());
          } else if (userModel.user?.isPolicy == false) {
            // Get.offAll(() => const TermsAndConditions());
          } else {
            // Get.offAll(() => const HomePage());
          }
        }
      }
    } catch (err) {
      appLogs("login Error: $err");
    }
  }
}
