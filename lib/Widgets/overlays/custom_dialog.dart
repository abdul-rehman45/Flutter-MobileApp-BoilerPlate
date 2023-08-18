import 'package:flutter/material.dart';
import 'package:flutterproject/Widgets/overlays/custom_loader.dart';
import 'package:flutterproject/constants/texts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';

class CustomDialogs {
  static void dismiss() => Get.back();

  static void showLoading({double? size, bool? barrierDismissible = true}) {
    Get.dialog(
      const CustomLoader(),
      // Loader(size: size),
      // barrierColor: AppColors.black.withOpacity(0.2),
      barrierDismissible: barrierDismissible!,
    );
  }

  static void showToast({String? message, bool isSuccess = false}) async {
    await Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: message ?? AppTexts.somethingWentWrong,
      //AppTexts.somethingWentWrong,
      fontSize: 12,
      gravity: ToastGravity.BOTTOM,
      // textColor: AppColors.white,
      toastLength: isSuccess ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      //backgroundColor: isSuccess ? AppColors.primary : AppColors.red,
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    this.title,
    this.description,
    this.button1,
    this.button2,
    this.descrpitionTextAlign = TextAlign.justify,
    this.tap1,
    this.tap2,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? button1;
  final String? button2;
  final TextAlign? descrpitionTextAlign;
  final VoidCallback? tap1;
  final VoidCallback? tap2;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightgrey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            Text(
              title ?? '',
              // style: Helper.setTextStyle(
              //   16,
              //   FontWeight.bold,
              //   color: AppColors.text,
              // ),
            ),
            // SizedBox(height: 30),
            if (description != null)
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  description ?? '',
                  textAlign: descrpitionTextAlign,
                  //   style: Helper.setTextStyle(16, FontWeight.w400,
                  //       color: AppColors.text),
                ),
              ),
            if (description == null) const SizedBox(height: 30),
            const Divider(height: 0),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: tap1,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            button1 ?? '',
                            // style: Helper.setTextStyle(
                            //   16,
                            //   // color: AppColors.blue,
                            //   FontWeight.w500,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: InkWell(
                      onTap: tap2,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            button2 ?? '',
                            // style: Helper.setTextStyle(
                            //   16,
                            //   FontWeight.w500,
                            //   color: AppColors.primary,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlockAndReportDialog extends StatefulWidget {
  final String leftButtonTitle, rightButtonTitle;
  final int? reportUserId;

  const BlockAndReportDialog(
      {Key? key,
      this.leftButtonTitle = "",
      this.rightButtonTitle = "",
      this.reportUserId})
      : super(key: key);

  @override
  _BlockAndReportDialogState createState() => _BlockAndReportDialogState();
}

class _BlockAndReportDialogState extends State<BlockAndReportDialog> {
  bool spam = false;
  bool photo = false;
  bool message = false;
  bool others = false;
  List list = [];

  void report() async {
    if (list.isNotEmpty) {
      Navigator.pop(context);
      // ignore: unused_local_variable
      String res = list.join(',');
      // var report =await UserMatches.reportUser(widget.reportUserId!, res);
      // if (report == true) {
      //   final navServices = Get.find<NavBarService>();
      //   navServices.navIndex.value = 3;
      //   Get.offAll(
      //     () => Home(),
      //   );
      // }
    }
    // else {
    //   CustomSnackBar.showSnackBar(
    //     message: AppStrings.reason,
    //     type: SnackBarType.error,
    //     seconds: 4,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.scaffold,
      insetPadding: EdgeInsets.all(16),
      contentPadding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      content: Container(
        // height: AppGlobals.screenHeight * 0.6,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you sure?\nTell us why",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.text),
                  textAlign: TextAlign.center,
                ),
                CheckBoxWidget(
                  checkText: "Feel like spam",
                  checkValue: spam,
                  list: list,
                ),
                CheckBoxWidget(
                  checkText: "Inappropriate photos",
                  checkValue: photo,
                  list: list,
                ),
                CheckBoxWidget(
                  checkText: "Inappropriate messages",
                  checkValue: message,
                  list: list,
                ),
                CheckBoxWidget(
                  checkText: "Others",
                  checkValue: others,
                  list: list,
                ),
                Column(
                  children: [
                    SizedBox(height: 32),
                    Row(
                      children: [
                        // Expanded(
                        //     child: GradientButton(
                        //         title: widget.leftButtonTitle,
                        //         isGradient: false,
                        //         onTap: () => Navigator.pop(context))),
                        // SizedBox(width: 20),
                        // Expanded(
                        //   child: GradientButton(
                        //       title: widget.rightButtonTitle, onTap: report),
                        // ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSimpleDialog extends StatelessWidget {
  const CustomSimpleDialog(
      {Key? key,
      this.title = '',
      this.description = '',
      this.onLeftButtonTap,
      this.onRightButtonTap,
      this.iconPath,
      this.leftButtonTitle = '',
      this.rightButtonTitle = '',
      this.showButtons = true})
      : super(key: key);

  final String title, description, leftButtonTitle, rightButtonTitle;
  final String? iconPath;
  final VoidCallback? onLeftButtonTap, onRightButtonTap;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(16),
      contentPadding: EdgeInsets.fromLTRB(20, showButtons ? 40 : 12, 20, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      content: Container(
        // height: AppGlobals.screenHeight * 0.6,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            showButtons
                ? SizedBox.shrink()
                : Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(bottom: 28),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close),
                    ),
                  ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  // style: Helper.textStyle(
                  //   16,
                  //   fontWeight: FontWeight.w600,
                  //   color: AppColors.black,
                  // ),
                ),
                SizedBox(height: 12),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  // style: Utilities.setTextStyle(
                  //   14,
                  //   fontWeight: FontWeight.w400,
                  //   color: AppColors.black,
                  // ),
                ),
                SizedBox(height: 22),
                Flexible(
                  child: Image.asset(
                    iconPath ?? "", //AppImages.dialoglogo,
                    width: Get.width * 0.7,
                    height: Get.height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                showButtons
                    ? Column(
                        children: [
                          SizedBox(height: 32),
                          Row(
                            children: [
                              // Expanded(
                              //     child: GradientButton(
                              //         title: leftButtonTitle,
                              //         isGradient: false,
                              //         onTap: onLeftButtonTap ??
                              //             () => Navigator.pop(context))),
                              SizedBox(width: 20),
                              // Expanded(
                              //     child: GradientButton(
                              //         title: rightButtonTitle,
                              //         onTap: onRightButtonTap ??
                              //             () => Navigator.pop(context))),
                            ],
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
                // SizedBox(height: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CheckBoxWidget extends StatefulWidget {
  String? checkText;
  bool? checkValue;
  List? list = [];

  CheckBoxWidget({this.checkText, this.checkValue, this.list, super.key});

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: AppColors.green),
          child: Checkbox(
            activeColor: AppColors.green,
            value: widget.checkValue,
            onChanged: (bool? value) {
              if (widget.checkValue == false) {
                widget.list!.add(widget.checkText);
                setState(() {});
              } else if (widget.checkValue == true) {
                widget.list!.remove(widget.checkText);

                setState(() {});
              }
              setState(() {
                widget.checkValue = value;
                print("${widget.checkValue}");
              });
            },
          ),
        ),
        Expanded(
            child: Text(widget.checkText!,
                style: TextStyle(fontSize: 14, color: AppColors.text))),
      ],
    );
  }
}



// import 'dart:ui';

// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Constants/globals.dart';
// import 'package:buddytobody/Utilities/buttons/gradient_button.dart';
// import 'package:buddytobody/Utilities/buttons/gradient_icon_button.dart';
// import 'package:flutter/material.dart';

// import '../utilities.dart';

// class CompleteGoalDialog extends StatelessWidget {
//   const CompleteGoalDialog(
//       {Key? key,
//       this.title = '',
//       this.description = '',
//       this.onTap,
//       this.iconPath,
//       this.buttonTitle = '',
//       this.rightButtonTitle = '',
//       this.showButtons = true})
//       : super(key: key);

//   final String title, description, buttonTitle, rightButtonTitle;
//   final String? iconPath;
//   final VoidCallback? onTap;
//   final bool showButtons;

//   @override
//   Widget build(BuildContext context) {
//     return BackdropFilter(
//       filter: ImageFilter.blur(
//         sigmaX: 5.0,
//         sigmaY: 5.0,
//       ),
//       child: AlertDialog(
//         backgroundColor: AppColors.dialogColor,
//         insetPadding: EdgeInsets.all(16),
//         contentPadding: EdgeInsets.fromLTRB(20, showButtons ? 40 : 12, 20, 0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(18.0),
//           ),
//         ),
//         content: Container(
//           // height: AppGlobals.screenHeight * 0.6,
//           width: double.infinity,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               showButtons
//                   ? SizedBox.shrink()
//                   : Container(
//                       alignment: Alignment.centerRight,
//                       padding: EdgeInsets.only(bottom: 28),
//                       child: InkWell(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(Icons.close, color: AppColors.textColor),
//                       ),
//                     ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     title,
//                     textAlign: TextAlign.center,
//                     style: Utilities.setTextStyle(
//                       16,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     description,
//                     textAlign: TextAlign.center,
//                     style: Utilities.setTextStyle(
//                       14,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.textColor,
//                     ),
//                   ),
//                   SizedBox(height: 22),
//                   Container(
//                     width: MediaQuery.of(context).size.width * .4,
//                     child: GradientButton(
//                       title:buttonTitle ,
//                       onTap: onTap!,
//                     ),
//                   ),
//                   Flexible(
//                     child: Image.asset(
//                       iconPath ?? AppImages.dog13,
//                       width: AppGlobals.screenWidth * 0.7,
//                       height: AppGlobals.screenHeight * 0.3,
//                       fit: BoxFit.fitHeight,
//                     ),
//                   ),
//                   // SizedBox(height: 20,)
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Constants/globals.dart';
// import 'package:buddytobody/UI/start/Authentication/sign_in_screen.dart';
// import 'package:buddytobody/Utilities/custom_rich_text.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ResetPasswordDialog extends StatelessWidget {
//   const ResetPasswordDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       insetPadding: EdgeInsets.all(16),
//       contentPadding: EdgeInsets.all(10),
//       // clipBehavior: Clip.antiAliasWithSaveLayer,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(18.0),
//         ),
//       ),
//       content: Container(
//         height: AppGlobals.screenHeight * 0.6,
//         width: double.infinity,
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(Icons.close),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Check your mail or messages",
//                     style: Utilities.setTextStyle(
//                       16,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.black,
//                     ),
//                   ),
//                   SizedBox(height: 12),
//                   Text(
//                     "We have sent a password recover\ninstruction to your mail.",
//                     textAlign: TextAlign.center,
//                     style: Utilities.setTextStyle(
//                       14,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.black,
//                     ),
//                   ),
//                   SizedBox(height: 22),
//                   Flexible(
//                     child: Image.asset(
//                       AppImages.dog13,
//                       height: AppGlobals.screenHeight * 0.3,
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   Text(
//                     "Did not receive message?",
//                     textAlign: TextAlign.center,
//                     style: Utilities.setTextStyle(
//                       14,
//                       fontWeight: FontWeight.w600,
//                       color: AppColors.black,
//                     ),
//                   ),
//                   SizedBox(height: 22),
//                   RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: Utilities.setTextStyle(14, color: AppColors.black),
//                       children: [
//                         TextSpan(
//                           text: "Check your spam filter, or try to another\n",
//                         ),
//                         TextSpan(
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () {
//                               Navigator.pop(context);
//                             },
//                           text: 'email address',
//                           style: Utilities.setTextStyle(14,
//                                   color: AppColors.lightGreen)
//                               .copyWith(decoration: TextDecoration.underline),
//                         ),
//                         // TextSpan(text: " or "),
//                         // TextSpan(
//                         //   recognizer: TapGestureRecognizer()
//                         //     ..onTap = () {
//                         //       print('navigate');
//                         //       Navigator.push(
//                         //           context,
//                         //           MaterialPageRoute(
//                         //             builder: (context) => SignIn(),
//                         //           ));
//                         //     },
//                         //   text: 'phone number',
//                         //   style: Utilities.setTextStyle(14,
//                         //           color: AppColors.lightGreen)
//                         //       .copyWith(decoration: TextDecoration.underline),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
