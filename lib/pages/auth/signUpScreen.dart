import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/constants/texts.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:flutterproject/helpers/validators.dart';
import 'package:get/get.dart';

import '../../Widgets/inputFields.dart/custom_inputfields.dart';
import '../../controllers/auth_controllers/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: Helper.borderRadius(radius: 24)),
                    child: Form(
                      key: controller.formkey,
                      child: Column(
                        children: [
                          Text(AppTexts.signUp,
                              style: Helper.textStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary)),
                          const SizedBox(height: 20),
                          CustomTextField(
                              fillColor: AppColors.white,
                              hintText: AppTexts.firstName,
                              controller: controller.tfFirstName,
                              validator: (text) => Validators.validate(text,
                                  msg: AppTexts.firstName,
                                  regExp: Validators.nameRegExp)),
                          const SizedBox(height: 20),
                          CustomTextField(
                              fillColor: AppColors.white,
                              hintText: AppTexts.lastName,
                              controller: controller.tfLastName,
                              validator: (text) => Validators.validate(text,
                                  msg: AppTexts.lastName,
                                  regExp: Validators.nameRegExp)),
                          const SizedBox(height: 20),
                          CustomTextField(
                              fillColor: AppColors.white,
                              hintText: AppTexts.email,
                              controller: controller.tfEmail,
                              validator: (text) => Validators.validate(text,
                                  msg: AppTexts.anEmail,
                                  regExp: Validators.emailRegExp)),
                          const SizedBox(height: 20),
                          CustomTextField(
                              fillColor: AppColors.white,
                              hintText: AppTexts.password,
                              controller: controller.tfPassword,
                              isPasswordField: true,
                              validator: (text) => Validators.validate(text,
                                  msg: AppTexts.password,
                                  regExp: Validators.passwordRegExp)),
                          const SizedBox(height: 20),
                          CustomTextField(
                              fillColor: AppColors.white,
                              hintText: AppTexts.confirmPassword,
                              controller: controller.tfConfirmPassword,
                              isPasswordField: true,
                              validator: (text) => Validators.confirmPassword(
                                  text, controller.tfPassword.text)),
                          const SizedBox(height: 20),
                          // CustomButton.fill(
                          //     text: AppTexts.signUp,
                          //     onTap: () { },
                          //     bgColor: AppColors.black,
                          //     textColor: AppColors.white),
                          const SizedBox(height: 10),
                          Text(AppTexts.or, style: Helper.textStyle()),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // CustomAccountButton(
                              //     onTap: () {},
                              //     text: AppTexts.facebook,
                              //     bgColor: AppColors.facebookBlue,
                              //     icon: AppIcons.facebook),
                              const SizedBox(width: 10),
                              // CustomAccountButton(
                              //     onTap: () => SocialAuth.googleAuth(),
                              //     text: AppTexts.google,
                              //     bgColor: AppColors.green,
                              //     icon: AppIcons.google,
                              //     ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: AppTexts.haveAccount,
                          style: Helper.textStyle(
                              fontSize: 10, color: AppColors.white),
                          children: [
                            TextSpan(
                              text: AppTexts.login,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //  Get.to(() => const LoginPage());
                                },
                              style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          );
        });
  }
}
