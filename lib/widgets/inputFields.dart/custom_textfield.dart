import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';


import '../../constants/colors.dart';
import '../../helpers/ui_helpers.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.title,
    this.hintText,
    this.controller,
    this.isPasswordField = false,
    this.isCheck = false,
    this.validator,
    this.suffixIcon,
    this.iconTap,
    this.keyboardType,
    this.onFieldSubmitted,
    this.onChanged,
    this.prefixIcon,
    this.maxLines = 1,
    this.borderColor,
    this.fillColor,
    this.onTap,
  }) : super(key: key);
  final String? hintText;
  final String? suffixIcon;
  final bool isPasswordField, isCheck;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? iconTap, onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? prefixIcon, title;
  final int? maxLines;
  final Color? borderColor, fillColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 4.sp, left: 2.sp),
                child: Text(
                  "$title",
                  style: Helper.textStyle(
                      color: textLightGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
            : const SizedBox.shrink(),
        TextFormField(
          obscureText: isPasswordField,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          textCapitalization: TextCapitalization.sentences,
          minLines: maxLines,
          maxLines: isPasswordField ? 1 : maxLines,
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          style: Helper.textStyle(fontSize: 14, color: textLightGrey),
          decoration: InputDecoration(
            fillColor: fillColor ?? tfbgFillColor,
            filled: true,
            hintText: hintText,
            prefixIcon: prefixIcon == null
                ? null
                : InkWell(
                    onTap: iconTap,
                    child: Image.asset(
                      prefixIcon!,
                      scale: 3.sp,
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
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            hintStyle: Helper.textStyle(
              color: tfTextHintColor,
              fontSize: 12,
            ),
            enabledBorder: _setBorder(),
            errorBorder: _setBorder(color: Colors.red),
            focusedBorder: _setBorder(),
            disabledBorder: _setBorder(),
            focusedErrorBorder: _setBorder(),
          ),
        ),
      ],
    );
  }

  InputBorder _setBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: Helper.borderRadius(radius: 8),
      borderSide: Helper.borderSide(color: color ?? borderColor ?? primary),
    );
  }

  static void unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
