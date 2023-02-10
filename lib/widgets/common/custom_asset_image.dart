import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage(
      {this.image,
      this.height = 100,
      this.padding = 0,
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
      height: height?.sp,
      padding: EdgeInsets.all(padding!.sp),
      child: Image.asset(
        image ?? "",
        fit: boxFit ?? BoxFit.contain,
      ),
    );
  }
}
