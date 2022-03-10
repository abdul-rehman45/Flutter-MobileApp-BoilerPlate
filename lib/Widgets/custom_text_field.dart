import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.isPasswordField = false,
    this.isCheck = false,
    this.validator,
    this.suffixIcon,
    this.iconTap,
    this.keyboardType,
    this.onChanged,
    this.prefixIcon,
    this.maxLines = 1,
    this.keyPad,
  }) : super(key: key);
  final String hintText;
  final String? suffixIcon;
  final bool isPasswordField, isCheck;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? iconTap, keyPad;
  final Function(String)? onChanged;
  final String? prefixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordField,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.sentences,
      minLines: 1,
      maxLines: isPasswordField ? 1 : maxLines,
      onChanged: onChanged,
      onTap: keyPad,
      style: Utilities.setTextStyle(14, color: AppColors.textColor),
      decoration: InputDecoration(
        fillColor: AppColors.bgColor,
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon == null
            ? null
            : InkWell(
                onTap: iconTap,
                child: Image.asset(
                  prefixIcon!,
                  scale: 2.5,
                ),
              ),
        suffixIcon: suffixIcon == null
            ? null
            : InkWell(
                onTap: iconTap,
                child: Image.asset(
                  suffixIcon!,
                  scale: isCheck ? 5 : 2.5,
                ),
              ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        hintStyle: Utilities.setTextStyle(14, color: AppColors.textColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide(color: AppColors.tfBorder),
        ),
      ),
    );
  }

  static void unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
