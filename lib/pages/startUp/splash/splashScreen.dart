import 'package:flutter/material.dart';
import 'package:flutterproject/controllers/intro/splash_controller.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.bgColor,
            body: Container(
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: const Center(
                  //     child: Image.asset(
                  //   AppGifs.splash,
                  //   scale: 2,
                  // ),
                  ),
            ),
          );
        });
  }
}
