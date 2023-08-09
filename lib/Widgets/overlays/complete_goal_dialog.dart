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
