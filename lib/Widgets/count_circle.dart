import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class CountCircle extends StatelessWidget {
  CountCircle({Key? key, this.size = 25, this.count}) : super(key: key);
  final double size;
  int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          count?.toString() ?? '0',
          style: Utilities.setTextStyle(
            12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
