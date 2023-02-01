import 'package:flutter/material.dart';
import 'package:flutterproject/constant/assets.dart';
import 'package:flutterproject/helpers/ui_helpers.dart';

import 'package:sizer/sizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    this.image,
    this.placeholder,
    this.width = 70,
    this.height = 60,
    this.radius = 6,
    this.fit = BoxFit.cover,
    this.placeHolderBoxFit,
  }) : super(key: key);
  final String? image, placeholder;
  final double width, height, radius;
  final BoxFit? fit, placeHolderBoxFit;

  @override
  Widget build(BuildContext context) {
    return image != null && image?.isNotEmpty == true
        ? ClipRRect(
            borderRadius: Helper.borderRadius(radius: radius),
            child: Image.network(
              image ?? AppImages.placeholderUrl,
              fit: fit,
              width: width.sp,
              height: height.sp,
              errorBuilder: (context, error, stackTrace) {
                return _errorBuilder(
                  image: placeholder,
                  fit: placeHolderBoxFit,
                );
              },
            ),
          )
        : _errorBuilder(
            image: placeholder,
            fit: placeHolderBoxFit,
          );
  }

  Widget _errorBuilder({String? image, BoxFit? fit = BoxFit.cover}) {
    return ClipRRect(
      borderRadius: Helper.borderRadius(radius: radius),
      child: Image.asset(
        image ?? AppImages.placeholder,
        fit: fit,
        width: width.sp,
        height: height.sp,
      ),
    );
  }
}
