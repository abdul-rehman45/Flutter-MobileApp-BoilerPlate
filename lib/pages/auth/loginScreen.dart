import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/controllers/auth_controllers/login_controller.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:flutterproject/helpers/validators.dart';
import 'package:get/get.dart';
import '../../Widgets/buttons/custom_button.dart';
import '../../Widgets/inputFields.dart/custom_inputfields.dart';
import '../../constants/colors.dart';
import '../../constants/texts.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: controller.formkey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const SizedBox(height: 30),
                          CustomTextField(
                              hintText: AppTexts.email,
                              controller: controller.tfEmail,
                              keyboardType: TextInputType.emailAddress,
                              validator: (text) => Validators.validate(text,
                                  msg: AppTexts.anEmail,
                                  regExp: Validators.emailRegExp)),
                          const SizedBox(height: 20),
                          CustomTextField(
                              hintText: AppTexts.password,
                              controller: controller.tfPassword,
                              isPasswordField: true,
                              validator: (text) => Validators.validate(text,
                                  msg: AppTexts.password,
                                  regExp: Validators.passwordRegExp)),
                          const SizedBox(height: 30),
                          CustomRichText(
                            title: AppTexts.forgotPassword,
                            linkTitle: AppTexts.resetPassword,
                            navigateToClass: Container(),
                          ),
                          const SizedBox(height: 30),
                          CustomElevatedButton(
                              title: AppTexts.login,
                              bgColor: AppColors.green,
                              onTap: () => controller.onLogin()),
                          const SizedBox(height: 20),
                          CustomRichText(
                              title: AppTexts.dontHaveAccount,
                              linkTitle: AppTexts.signUp,
                              navigateToClass: Container()),
                          const SizedBox(height: 30),
                          CustomTextButton(
                              title: AppTexts.termsConditions, onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {Key? key,
      this.color,
      required this.title,
      required this.linkTitle,
      required this.navigateToClass,
      this.termAndPrivacyCall = false,
      this.url})
      : super(key: key);
  final String title, linkTitle;
  final Widget navigateToClass;
  final Color? color;
  final bool termAndPrivacyCall;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Helper.textStyle(fontSize: 14, color: color),
        children: [
          TextSpan(text: title),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('navigate');
                  if (termAndPrivacyCall == false) {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => navigateToClass));
                  } else {
                    // AppGlobals().urlLuncher(
                    //   url: url,
                    // );
                  }
                },
              text: linkTitle,
              style: Helper.textStyle(fontSize: 14, color: AppColors.green)
                  .copyWith(decoration: TextDecoration.underline))
        ],
      ),
    );
  }
}
