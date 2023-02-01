import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:sizer/sizer.dart';

class CustomBgIllustraion extends StatelessWidget {
  const CustomBgIllustraion(
      {this.image,
      this.height = 30,
      this.padding = 20,
      this.width,
      this.boxFit,
      super.key});
  final String? image;
  final double? height, width, padding;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      height: height?.h,
      padding: EdgeInsets.all(padding!.sp),
      child: Image.asset(
        image ?? "",
        fit: boxFit ?? BoxFit.contain,
      ),
    );
  }
}
