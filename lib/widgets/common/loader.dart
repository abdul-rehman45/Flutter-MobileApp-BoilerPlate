import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, color: white),
        padding: EdgeInsets.all(10.sp),
        child: LoadingAnimationWidget.threeArchedCircle(
          color: primary,
          size: 20.sp,
        ),
      ),
    );
  }
}
