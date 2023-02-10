// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';

// class CartItemsCounter extends StatelessWidget {
//   CartItemsCounter({Key? key, this.count, this.onPressed}) : super(key: key);
//   VoidCallback? onPressed;
//   int? count;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         height: 50,
//         width: 50,
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: AppColors.lightGreen,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Image.asset(
//               AppIcons.bagFilled,
//               color: Colors.white,
//             ),
//             Positioned(
//               top: 10,
//               child: Text(
//                 "${count ?? 0}",
//                 overflow: TextOverflow.ellipsis,
//                 style: Utilities.setTextStyle(
//                   12,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.lightGreen,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
