// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';

// class CustomMonthPicker extends StatelessWidget {
//   CustomMonthPicker(
//       {Key? key, required this.selectedMonth, required this.onSelected})
//       : super(key: key);

//   final int selectedMonth;
//   final Function(int) onSelected;

//   final List<String> _months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [BoxShadow(
//             color: AppColors.shadowColor.withOpacity(0.2),
//             blurRadius: 40,
//             offset: Offset(0,15),

//           )],
//           color: AppColors.monthsBg),
//       child: Column(
//         children: [
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18) ),
//               color: AppColors.messageBg,
//             ),
//             child: Center(
//               child: Text(
//                 'Choose the month',
//                 style: Utilities.setTextStyle(16, color: AppColors.textColor),
//               ),
//             ),
//           ),
//           GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4, childAspectRatio: 1.6),
//               itemCount: _months.length,
//               itemBuilder: (context, index) => InkWell(
//                     onTap: () => onSelected(index + 1),
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: selectedMonth == index + 1
//                               ? AppColors.lightGreen
//                               : Colors.transparent),
//                       child: Text(
//                         _months[index].substring(0, 3),
//                         style: Utilities.setTextStyle(16,
//                             fontWeight: FontWeight.w500,
//                             color: selectedMonth == index + 1
//                                 ? AppColors.white
//                                 : AppColors.greyTextColor),
//                       ),
//                     ),
//                   ))
//         ],
//       ),
//     );
//   }
// }
