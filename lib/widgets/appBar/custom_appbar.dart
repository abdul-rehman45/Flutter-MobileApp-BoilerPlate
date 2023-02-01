import 'package:flutter/material.dart';
import 'package:flutterproject/constant/assets.dart';
import 'package:flutterproject/constant/colors.dart';
import 'package:flutterproject/helpers/ui_helpers.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BackBar extends StatelessWidget {
  const BackBar({super.key, this.title, this.showIcon = true});
  final String? title;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.sp, top: 30.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showIcon)
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  width: 25.sp,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    // child:
                    // Image.asset(
                    //   AppIcons.back,
                    //   color: Colors.white,
                    //   //.withOpacity(0.8),
                    // ), your back icon here
                  ),
                ),
              ),
            ),
          if (title != null)
            Text(
              title ?? '',
              style: Helper.textStyle(
                fontSize: 18,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
