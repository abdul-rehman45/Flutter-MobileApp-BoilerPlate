import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isMarked;
  final VoidCallback? onClick;
  final double? size;
  final Color? borderColor, markedcolor;

  const CustomRadioButton({
    Key? key,
    this.isMarked = false,
    this.onClick,
    this.size,
    this.borderColor,
    this.markedcolor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: size ?? 24,
        height: size ?? 24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: borderColor ?? AppColors.lightGreen,
              width: 1,
            )),
        child: Center(
          child: isMarked
              ? Container(
                  width: size != null ? (size! - 6) : 15,
                  height: size != null ? (size! - 6) : 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: markedcolor ?? AppColors.lightGreen,
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
