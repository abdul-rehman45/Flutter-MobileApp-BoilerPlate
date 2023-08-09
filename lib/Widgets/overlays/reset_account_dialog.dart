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
