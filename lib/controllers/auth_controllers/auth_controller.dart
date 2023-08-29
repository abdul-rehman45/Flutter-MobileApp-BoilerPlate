// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutterproject/Widgets/overlays/custom_dialog.dart';
import 'package:flutterproject/backend/apis/apis.dart';
import 'package:flutterproject/backend/models/auth/user_model.dart';
import 'package:flutterproject/constants/globals.dart';
import 'package:flutterproject/constants/texts.dart';
import 'package:flutterproject/constants/url.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:flutterproject/helpers/storage_helper.dart';

class SocialAuth {
  static Future<void> googleAuth() async {
    // GoogleSignInAccount? _googleUser;
    // try {
    //   GoogleSignIn googleSignIn = GoogleSignIn();
    //   _googleUser =
    //       await googleSignIn.signInSilently() ?? await googleSignIn.signIn();

    //   appLogs("google login user: ${_googleUser?.displayName}");
    //   if (_googleUser != null) {
    //     socialSignUp(
    //         firstName: _googleUser.displayName,
    //         email: _googleUser.email,
    //         photoUrl: _googleUser.photoUrl,
    //         type: "Google");
    //   }
    // } catch (e) {
    //   appLogs(e.toString());
    // }
  }

  static Future<void> googleAuthSignOut() async {
    // try {
    //   GoogleSignIn googleSignIn = GoogleSignIn();
    //   await googleSignIn.signOut();
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }

  static Future<void> facebookAuth() async {}

  static Future<void> facebookAuthSignOut() async {}

  static Future<void> socialSignUp(
      {String? firstName,
      String? lastName,
      String? email,
      String? photoUrl,
      String? type}) async {
    try {
      var response = await api(RestMethods.POST, AppUrls.baseUrl,
          data: {
            "firstName": firstName ?? "",
            "lastName": lastName ?? "",
            "email": email,
            "imageUrl": photoUrl ?? "",
            "type": type
          },
          showLoader: true,
          showToast: true,
          showSuccessMessage: true,
          isJson: true);

      if (response != null) {
        UserModel userModel = UserModel.fromJson(response);

        AppGlobals.user = userModel;
        StorageHelper.saveVariable(AppKeys.user, userModel.toJson());
        if (userModel.user != null) {
          if (userModel.user?.role == null || userModel.user?.role == "") {
            //Get.offAll(() => const RoleSelectionPage());
          } else if (userModel.user?.isPolicy == false) {
            //Get.offAll(() => const TermsAndConditions());
          } else {
            //Get.offAll(() => const HomePage());
          }
        }
      }
    } catch (err) {
      appLogs("Social SignUp Error: $err");
    }
  }

  logout() async {
    appLogs("logging out user ${AppGlobals.user?.toJson()}");
    //  SocialAuth.googleAuthSignOut();
    if (AppGlobals.user != null && AppGlobals.user?.user != null) {
      if (AppGlobals.user?.user?.userType == "Google") {
        SocialAuth.googleAuthSignOut();
      }
      if (AppGlobals.user?.user?.userType == "Facebook") {
        SocialAuth.facebookAuthSignOut();
      }
      var response = await api(RestMethods.POST, AppUrls.baseUrl,
          queryParam: "?userId=${AppGlobals.user?.user?.userId}",
          showLoader: true,
          isJson: true,
          showToast: true,
          showSuccessMessage: true);
      if (response == true) {
        StorageHelper.clearStorage();
        //Get.offAll(() => const LandingPage());
      } else {
        CustomDialogs.showToast(message: AppTexts.somethingWentWrong);
      }
    }
  }
}
