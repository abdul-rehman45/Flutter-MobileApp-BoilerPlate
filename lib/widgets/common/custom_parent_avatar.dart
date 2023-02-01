// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Utilities/buttons/CustomRadioButton.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';

// class CustomParentAvatar extends StatelessWidget {
//   const CustomParentAvatar(
//       {Key? key,
//       required this.iconPath,
//       this.isSelected = false,
//       required this.onTap,
//       required this.title})
//       : super(key: key);

//   final String iconPath, title;
//   final bool isSelected;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: isSelected
//                     ? Border.all(color: AppColors.lightGreen, width: 3)
//                     : null),
//             child: Center(
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage(iconPath),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           CustomRadioButton(isMarked: isSelected),
//           SizedBox(height: 10),
//           Text(
//             title,
//             style: Utilities.setTextStyle(16),
//           ),
//         ],
//       ),
//     );
//   }
// }
