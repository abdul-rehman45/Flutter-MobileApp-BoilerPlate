// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/globals.dart';
// import 'package:flutter/material.dart';

// class MatchAvatar extends StatelessWidget {
//   MatchAvatar({Key? key, this.imageUrl}) : super(key: key);
//   String? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: imageUrl != null
//           ? Container(
//               height: AppGlobals.screenWidth * 0.3,
//               width: AppGlobals.screenWidth * 0.3,
//               padding: EdgeInsets.all(5),
//               child: Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(color: Colors.white, width: 2),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: Image.network(
//                     imageUrl ?? '',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             )
//           : Container(
//               height: AppGlobals.screenWidth * 0.3,
//               width: AppGlobals.screenWidth * 0.3,
//               padding: EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 color: AppColors.lightGreen,
//                 shape: BoxShape.circle,
//               ),
//             ),
//     );
//   }
// }
