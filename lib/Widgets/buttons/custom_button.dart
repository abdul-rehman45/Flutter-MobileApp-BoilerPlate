import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      this.borderColor,
      this.bgColor,
      this.textColor,
      required this.onTap})
      : super(key: key);

  final String title;
  final Color? borderColor, bgColor, textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(40),
            color: bgColor
            //?? AppColors.lightGreen,
            ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: Utilities.setTextStyle(14,
                fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }
}
