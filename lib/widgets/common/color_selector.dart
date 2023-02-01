import 'package:flutter/material.dart';
import 'package:flutterproject/constant/colors.dart';

class ColorSelector extends StatelessWidget {
  ColorSelector({
    Key? key,
    required this.color,
    this.selected,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final bool? selected;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 14,
        width: 14,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected == true ? AppColors.scaffold : Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
