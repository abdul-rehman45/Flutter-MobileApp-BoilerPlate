// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Constants/globals.dart';
// import 'package:buddytobody/Utilities/custom_text_field.dart';
// import 'package:flutter/material.dart';

// class SendMessageField extends StatelessWidget {
//   const SendMessageField(
//       {Key? key,
//       this.sendTap,
//       this.controller,
//       this.onFileTap,
//       this.onEmojiTap,
//       this.keyPadTapped})
//       : super(key: key);
//   final VoidCallback? sendTap, onFileTap, onEmojiTap, keyPadTapped;
//   // final Function(String)? onChanged;
//   final TextEditingController? controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       // height: 60,
//       decoration: BoxDecoration(
//         // borderRadius: BorderRadius.circular(30),
//         gradient: LinearGradient(
//           begin: Alignment.bottomLeft,
//           end: Alignment.topRight,
//           colors: [
//             // AppColors.g6Color,
//             AppColors.g5Color,
//             // AppColors.g4Color,
//             AppColors.g3Color,
//             // AppColors.g2Color,
//             // AppColors.lightGreen,
//           ],
//         ),
//       ),
//       child: Row(
//         children: [
//           InkWell(
//             onTap: onEmojiTap,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               child: Image.asset(AppIcons.smile, height: 22),
//             ),
//           ),
//           InkWell(
//             onTap: onFileTap,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 5),
//               child: Image.asset(AppIcons.file, height: 22),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 5),
//               child: CustomTextField(
//                 controller: controller,
//                 hintText: 'Type a message...',
//                 keyPad: keyPadTapped,
//                 maxLines: 4,
//                 // onChanged: (text) {
//                 //   if (onChanged != null) onChanged!(text);
//                 // },
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: sendTap,
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 5),
//               child: Image.asset(AppIcons.send, height: 22),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
