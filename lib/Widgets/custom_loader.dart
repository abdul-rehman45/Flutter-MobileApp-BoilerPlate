import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        // child: /* CircularProgressIndicator()*/
        //     Image.asset(
        //   AppGifs.paw,
        //   width: AppGlobals.screenWidth * 0.4,
        //   color: AppColors.lightGreen,
        // ),
      ),
    );
  }

  // static void show() {
  //   Get.dialog(
  //     CustomLoader(),
  //     barrierDismissible: false,
  //   );
  // }

  // static void dismiss() => Get.back();

  void progressDialog(BuildContext context, {String? msg}) {
    // // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            // child: /* CircularProgressIndicator()*/
            //     Image.asset(
            //   AppGifs.paw,
            //   width: 200,
            //   color: AppColors.lightGreen,
            // ),
          ),
        );
      },
    );
  }
}
