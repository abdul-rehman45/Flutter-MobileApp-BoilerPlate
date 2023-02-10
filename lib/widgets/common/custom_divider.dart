import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/colors.dart';
import 'package:sizer/sizer.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, this.thickness, this.height});
  final Color? color;
  final double? thickness, height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 0,
      thickness: thickness ?? 0.3.sp,
      color: color ?? whiteShade,
    );
  }
}
