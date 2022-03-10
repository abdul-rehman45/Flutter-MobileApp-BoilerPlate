// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';

// class OverViewItem extends StatelessWidget {
//   OverViewItem({Key? key, this.detail, this.icon}) : super(key: key);
//   String? icon, detail;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Image.asset(
//             icon ?? AppIcons.dog,
//             height: 18,
//           ),
//           SizedBox(width: 8),
//           Flexible(
//             child: Text(
//               detail ?? '',
//               softWrap: true,
//               overflow: TextOverflow.ellipsis,
//               style: Utilities.setTextStyle(
//                 14,
//                 color: AppColors.textColor,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
