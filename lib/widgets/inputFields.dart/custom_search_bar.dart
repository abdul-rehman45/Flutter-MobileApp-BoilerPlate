import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../helpers/helpers.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChangeFunction;
  final TextEditingController? controller;
  const CustomSearchBar({Key? key, this.controller, this.onChangeFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: AppGlobals.screenWidth * 0.1),
      child: CupertinoSearchTextField(
        controller: controller,
        itemColor: AppColors.green,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.bgColor),
        ),
        style: Helper.textStyle(fontSize: 14, color: AppColors.grey),
        padding: EdgeInsets.fromLTRB(22, 10, 12, 10),
        onChanged: onChangeFunction,
      ),
    );
  }
}
