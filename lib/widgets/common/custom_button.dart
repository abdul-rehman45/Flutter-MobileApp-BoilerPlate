import 'package:flutter/material.dart';


import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helpers/ui_helpers.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.title,
    this.textSize = 12,
    this.textWeight,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final FontWeight? textWeight;
  final double textSize;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title ?? '',
        style: Helper.textStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight,
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.onTap,
    this.title,
    this.bgColor,
    this.isFilled = true,
    this.isActive = true,
    this.height,
    this.width,
    this.fontSize = 12,
    this.radius = 6,
    this.elevation = 0,
    this.borderColor,
    this.activeTextColor,
    this.contentWidget,
    this.horizontalPadding = 10,
    this.verticalPadding = 10,
  }) : super(key: key);
  final String? title;
  final VoidCallback? onTap;
  final bool isFilled, isActive;
  final Color? bgColor, borderColor, activeTextColor;
  final double? height, width;
  final double fontSize, radius, elevation, horizontalPadding, verticalPadding;

  final Widget? contentWidget;

  @override
  Widget build(BuildContext context) {
    Size buttonSize = Size(
      (width ?? 250).sp,
      (height ?? 0).sp,
    );
    return ElevatedButton(
      onPressed: !isActive ? null : onTap,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        minimumSize: width != null ? buttonSize : null,
        foregroundColor: primary,
        backgroundColor: !isActive
            ? Colors.grey
            //AppColors.lightGrey
            : isFilled
                ? bgColor ?? primary
                : Colors.white,
        disabledBackgroundColor: Colors.grey,
        // AppColors.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: Helper.borderRadius(radius: radius.sp),
          side: !isActive || isFilled
              ? BorderSide.none
              : Helper.borderSide(color: borderColor ?? primary),
        ),

        visualDensity: const VisualDensity(vertical: -4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding.sp, vertical: verticalPadding.sp),
        child: contentWidget ??
            Text(
              title ?? '',
              textAlign: TextAlign.center,
              style: Helper.textStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: isFilled && isActive
                    ? activeTextColor ?? Colors.white
                    : primary,
              ),
            ),
      ),
    );
    //);
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key, this.icon, this.onTap, this.iconPath, this.color, this.size})
      : super(key: key);
  final IconData? icon;
  final double? size;
  final String? iconPath;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon ?? Icons.add,
        color: color,
        size: size,
        //.h,
      ),
    );
  }
}

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
// class CustomTextButton extends StatelessWidget {
//   const CustomTextButton(
//       {Key? key, this.title, this.onTap, this.filled = false})
//       : super(key: key);
//   final String? title;
//   final VoidCallback? onTap;
//   final bool filled;
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onTap,
//       style: !filled
//           ? null
//           : TextButton.styleFrom(
//               // backgroundColor: AppColors.primary,
//               // shape: RoundedRectangleBorder(
//               //   borderRadius: Utilities.borderRadius(),
//               // ),
//               ),
//       child: Padding(
//         padding: const EdgeInsets.all(4),
//         //.r,
//         child: Text(
//           title ?? '',
//           // style: Utilities.setTextStyle(
//           //   fontWeight: FontWeight.w500,
//           //   color: !filled ? Colors.black : Colors.white,
//           // ),
//         ),
//       ),
//     );
//   }
// }
// class CustomButton extends StatelessWidget {
//   const CustomButton(
//       {Key? key,
//       required this.title,
//       this.borderColor,
//       this.bgColor,
//       this.textColor,
//       required this.onTap})
//       : super(key: key);

//   final String title;
//   final Color? borderColor, bgColor, textColor;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//             border: Border.all(
//               color: borderColor ?? Colors.transparent,
//             ),
//             borderRadius: BorderRadius.circular(40),
//             color: bgColor
//             //?? AppColors.lightGreen,
//             ),
//         child: Center(
//           child: Text(
//             title.toUpperCase(),
//             style: Utilities.setTextStyle(14,
//                 fontWeight: FontWeight.w600, color: textColor),
//           ),
//         ),
//       ),
//     );
//   }
//}

// class CustomRadioButton extends StatelessWidget {
//   final bool isMarked;
//   final VoidCallback? onClick;
//   final double? size;
//   final Color? borderColor, markedcolor;

//   const CustomRadioButton({
//     Key? key,
//     this.isMarked = false,
//     this.onClick,
//     this.size,
//     this.borderColor,
//     this.markedcolor,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onClick,
//       child: Container(
//         width: size ?? 24,
//         height: size ?? 24,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(
//               color: borderColor ?? AppColors.lightGreen,
//               width: 1,
//             )),
//         child: Center(
//           child: isMarked
//               ? Container(
//                   width: size != null ? (size! - 6) : 15,
//                   height: size != null ? (size! - 6) : 15,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: markedcolor ?? AppColors.lightGreen,
//                   ),
//                 )
//               : Container(),
//         ),
//       ),
//     );
//   }
// }

//
// class GradientButton extends StatelessWidget {
//   const GradientButton(
//       {Key? key,
//       required this.title,
//       this.isGradient = true,
//       required this.onTap})
//       : super(key: key);

//   final String title;
//   final bool isGradient;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(1.5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             colors: [
//               // AppColors.g6Color,
//               //  AppColors.g5Color,
//               // AppColors.g4Color,
//               //  AppColors.g3Color,
//               // AppColors.g2Color,
//               // AppColors.lightGreen,
//             ],
//           ),
//         ),
//         child: Container(
//           height: 35,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: isGradient ? Colors.transparent : AppColors.dialogColor,
//           ),
//           child: Center(
//             child: GradientText(
//               title.toUpperCase(),
//               gradient: isGradient
//                   ? LinearGradient(colors: [Colors.white, Colors.white])
//                   : LinearGradient(
//                       begin: Alignment.bottomLeft,
//                       end: Alignment.topRight,
//                       colors: [
//                         AppColors.g5Color,
//                         AppColors.g3Color,
//                       ],
//                     ),
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class GradientIconButton extends StatelessWidget {
//   const GradientIconButton(
//       {Key? key,
//       required this.title,
//       this.isGradient = true,
//       required this.onTap,
//       required this.iconData})
//       : super(key: key);

//   final String title;
//   final bool isGradient;
//   final VoidCallback onTap;
//   final IconData iconData;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.all(1.5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//             colors: [
//               AppColors.g5Color,
//               AppColors.g3Color,
//             ],
//           ),
//         ),
//         child: Container(
//           height: 35,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: isGradient ? Colors.transparent : AppColors.dialogColor,
//           ),
//           child: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GradientText(
//                   title.toUpperCase(),
//                   gradient: isGradient
//                       ? LinearGradient(colors: [Colors.white, Colors.white])
//                       : LinearGradient(
//                           begin: Alignment.bottomLeft,
//                           end: Alignment.topRight,
//                           colors: [
//                             AppColors.g5Color,
//                             AppColors.g3Color,
//                           ],
//                         ),
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(width: 10),
//                 Icon(
//                   iconData,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }