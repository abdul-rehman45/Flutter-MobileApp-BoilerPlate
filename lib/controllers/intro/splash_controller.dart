import 'package:flutterproject/backend/models/auth/user_model.dart';
import 'package:flutterproject/constants/globals.dart';
import 'package:flutterproject/helpers/storage_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    _getSavedData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void _getSavedData() async {
    var user = await StorageHelper.getVariable(AppKeys.user);
    if (user != null) {
      UserModel userModel = UserModel.fromJson(user);
      AppGlobals.user = userModel;
      if (userModel.user?.role == null || userModel.user?.role == "") {
        //  Get.offAll(() => RoleSelectionPage());
      } else if (userModel.user?.isPolicy == false) {
        // Get.offAll(() => TermsAndConditions());
      } else {
        // Get.offAll(() => HomePage());
      }
      // profileController.user = User.fromJson(user);
    } else {
      //Get.offAll(() => LandingPage());
    }
  }
}
