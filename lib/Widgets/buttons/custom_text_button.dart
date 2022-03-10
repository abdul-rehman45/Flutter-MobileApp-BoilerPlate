import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {Key? key,
      this.title,
      this.icon,
      this.onTap,
      this.weight,
      this.textcolor})
      : super(key: key);
  String? icon, title;
  Color? textcolor;
  VoidCallback? onTap;
  FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Image.asset(icon ?? '', height: 15),
            ),
          Text(
            title ?? '',
            style: Utilities.setTextStyle(14,
                    color: textcolor, fontWeight: weight ?? FontWeight.w400)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
