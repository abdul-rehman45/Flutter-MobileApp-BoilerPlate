import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../constants/assets.dart';
import '../../helpers/helpers.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    this.image,
    this.placeholder,
    this.width = 70,
    this.height = 60,
    this.radius = 6,
    this.padding = 0,
    this.fit = BoxFit.cover,
    this.placeHolderBoxFit,
  }) : super(key: key);
  final String? image, placeholder;
  final double width, height, radius, padding;
  final BoxFit? fit, placeHolderBoxFit;

  @override
  Widget build(BuildContext context) {
    return image != null && image?.isNotEmpty == true
        ? Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              borderRadius: Helper.borderRadius(radius: radius),
            ),
            child: Image.network(
              image ?? AppImages.placeholderUrlImg,
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
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: Helper.borderRadius(radius: radius),
      ),
      child: Image.asset(
        image ?? AppImages.placeHolderImg,
        fit: fit,
        width: width.sp,
        height: height.sp,
      ),
    );
  }
}
