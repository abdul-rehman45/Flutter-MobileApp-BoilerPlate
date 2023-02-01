// import 'package:flutter/material.dart';
// import 'package:flutterproject/Constant/app_colors.dart';

// enum SnackBarType {
//   error,
//   success,
// }

// class CustomSnackBar {
//   static void showSnackBar(
//       {String? message, SnackBarType? type, int? seconds}) {
//     Snackbar(
//       SnackBarType.error == type ? 'Error' : 'Success',
//       message ?? '',
//       icon: Icon(
//         SnackBarType.error == type ? Icons.error : Icons.check_circle,
//         color: Colors.white,
//       ),
//       backgroundColor:
//           SnackBarType.error == type ? Colors.red : AppColors.lightGreen,
//       isDismissible: true,
//       shouldIconPulse: false,
//       colorText: Colors.white,
//       duration: Duration(seconds: seconds ?? 2),
//     );
//   }
// }