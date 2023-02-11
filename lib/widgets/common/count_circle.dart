import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/ui_helpers.dart';


class CountCircle extends StatelessWidget {
  CountCircle({Key? key, this.size = 25, this.count}) : super(key: key);
  final double size;
  int? count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          count?.toString() ?? '0',
          style: Helper.textStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
