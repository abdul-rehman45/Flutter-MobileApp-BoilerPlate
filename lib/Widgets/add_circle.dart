import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import '../Utilities/utilities.dart';

class AddCircle extends StatelessWidget {
  const AddCircle({Key? key, this.radius = 30, this.onPressed})
      : super(key: key);
  final double radius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: AppColors.bgColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
              // size: 24,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'Add',
              overflow: TextOverflow.visible,
              style: Utilities.setTextStyle(14,
                  color: AppColors.textColor, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
