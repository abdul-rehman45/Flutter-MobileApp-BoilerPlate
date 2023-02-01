// import 'package:flutter/material.dart';
// import 'package:flutterproject/constant/colors.dart';
// import 'package:flutterproject/constant/globals.dart';
// import 'package:flutterproject/helpers/ui_helpers.dart';

// import 'package:flutterproject/widgets/common/gradient_text.dart';

// class GraphContainer extends StatefulWidget {
//   GraphContainer({Key? key}) : super(key: key);

//   @override
//   State<GraphContainer> createState() => _GraphContainerState();
// }

// class _GraphContainerState extends State<GraphContainer> {
//   int _selectedBar = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18),
//               color: AppColors.graphBg,
//             ),
//             padding: EdgeInsets.only(left: 16, right: 16, top: 20),
//             alignment: Alignment.bottomCenter,
//             height: AppGlobals.screenHeight * 0.32,
//             width: AppGlobals.screenWidth,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 for (int i = 0; i <= 6; i++)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       if (_selectedBar == i)
//                         GradientText(
//                           "${i * 200}",
//                           style: Utilities.setTextStyle(18,
//                               fontWeight: FontWeight.w600),
//                           gradient: LinearGradient(
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                             colors: [
//                               AppColors.g5Color,
//                               AppColors.g3Color,
//                             ],
//                           ),
//                         ),
//                       SizedBox(height: 10),
//                       _graphBar(i * 20, i),
//                     ],
//                   )
//               ],
//             )),
//         Padding(
//           padding: EdgeInsets.only(left: 16, right: 16, top: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               for (int i = 0; i <= 6; i++)
//                 Container(
//                   width: 28,
//                   child: Text(
//                     '18:00',
//                     style:
//                         Helper.textStyle(fontSize:10, color: AppColors.text),
//                   ),
//                 )
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _graphBar(double height, int index) => InkWell(
//         onTap: () {
//           setState(() => _selectedBar = index);
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 400),
//           width: 25,
//           height: height == 0 ? 8 : height,
//           // margin: EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(2),
//             gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: _selectedBar == index
//                   ? [
//                       AppColors.g5Color,
//                       AppColors.g3Color,
//                     ]
//                   : [
//                       AppColors.barColor.withOpacity(0.14),
//                       AppColors.barColor,
//                       AppColors.barColor,
//                     ],
//             ),
//           ),
//         ),
//       );
// }
