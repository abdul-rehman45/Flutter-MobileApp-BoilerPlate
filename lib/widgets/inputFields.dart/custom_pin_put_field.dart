import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class PinPutField extends StatelessWidget {
  PinPutField(
      {Key? key,
      this.fillColor,
      this.borderColor,
      required this.controller,
      this.codeLength = 4,
      this.onCompleted})
      : super(key: key);
  final Color? fillColor, borderColor;
  final TextEditingController controller;
  final int codeLength;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: codeLength,
      defaultPinTheme: _defaultPinTheme,
      focusedPinTheme: _focusedPinTheme,
      keyboardType: TextInputType.number,
      controller: controller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      onCompleted: onCompleted,
    );
  }

  static final _defaultPinTheme = PinTheme(
    width: 18.w,
    height: 18.w,
    textStyle: TextStyle(
        fontSize: 18.sp,
        color: AppColors.tfTextColor,
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
  );
  final _focusedPinTheme = _defaultPinTheme.copyBorderWith(
      border: Border.all(color: AppColors.primary));
}
