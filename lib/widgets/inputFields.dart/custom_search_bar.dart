import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/constant/colors.dart';
import 'package:flutterproject/helpers/ui_helpers.dart';

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
        itemColor: green,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: bgColor),
        ),
        style: Helper.textStyle(fontSize: 14, color: grey),
        padding: EdgeInsets.fromLTRB(22, 10, 12, 10),
        onChanged: onChangeFunction,
      ),
    );
  }
}
