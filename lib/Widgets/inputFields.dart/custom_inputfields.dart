import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/constants/colors.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.title,
      this.hintText,
      this.controller,
      this.isPasswordField = false,
      this.isCheck = false,
      this.readOnly = false,
      this.validator,
      this.suffixIcon,
      this.iconTap,
      this.keyboardType,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.onChanged,
      this.prefixIcon,
      this.maxLines = 1,
      this.maxLength,
      this.borderColor,
      this.fillColor,
      this.onTap,
      this.height})
      : super(key: key);
  final String? hintText, prefixIcon, title, suffixIcon;
  final bool isPasswordField, isCheck, readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? iconTap, onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines, maxLength;
  final Color? borderColor, fillColor;
  final double? height;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();

  static void unFocus() {
    // FocusScope.of(context).requestFocus(FocusNode());
    Get.focusScope!.unfocus();
  }
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = true;

  void _toggleShowPassword() {
    hidePassword = !hidePassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 10, left: 2.sp, top: 10),
                child: Text("${widget.title}", style: Helper.textStyle()))
            : const SizedBox.shrink(),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            enableInteractiveSelection: true,

            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            minLines: widget.maxLines,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            maxLines: widget.isPasswordField ? 1 : widget.maxLines,
            maxLength: widget.maxLength ?? (widget.maxLines! * 50),
            obscureText:
                widget.isPasswordField ? hidePassword : widget.isPasswordField,
            onFieldSubmitted: widget.onFieldSubmitted,
            inputFormatters: widget.inputFormatters,
            textCapitalization: TextCapitalization.words,
            // [if (digitsOnly) FilteringTextInputFormatter.digitsOnly],
            style: Helper.textStyle(),

            decoration: InputDecoration(
              counterText: '',
              fillColor: widget.fillColor ?? AppColors.white,
              filled: true,
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : InkWell(
                      onTap: widget.iconTap,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(widget.prefixIcon!,
                            width: 12.sp, color: AppColors.textLightGrey),
                      ),
                    ),
              suffixIcon: widget.suffixIcon == null
                  ? _hidePasswordIcon()
                  : InkWell(
                      onTap: widget.iconTap,
                      child: Image.asset(
                        widget.suffixIcon!,
                        scale: widget.isCheck ? 5 : 2.5,
                      ),
                    ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              hintStyle: Helper.textStyle(),
              enabledBorder: _setBorder(),
              errorBorder: _setBorder(color: Colors.red),
              focusedBorder: _setBorder(),
              disabledBorder: _setBorder(),
              focusedErrorBorder: _setBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _hidePasswordIcon() {
    if (widget.isPasswordField) {
      return IconButton(
        icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
        onPressed: _toggleShowPassword,
      );
    } else {
      return null;
    }
  }

  InputBorder _setBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: Helper.borderRadius(radius: 8),
      borderSide: Helper.borderSide(
          color: color ?? widget.borderColor ?? AppColors.grey),
    );
  }
}

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
// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';

// class CustomMonthPicker extends StatelessWidget {
//   CustomMonthPicker(
//       {Key? key, required this.selectedMonth, required this.onSelected})
//       : super(key: key);

//   final int selectedMonth;
//   final Function(int) onSelected;

//   final List<String> _months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [BoxShadow(
//             color: AppColors.shadowColor.withOpacity(0.2),
//             blurRadius: 40,
//             offset: Offset(0,15),

//           )],
//           color: AppColors.monthsBg),
//       child: Column(
//         children: [
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18) ),
//               color: AppColors.messageBg,
//             ),
//             child: Center(
//               child: Text(
//                 'Choose the month',
//                 style: Utilities.setTextStyle(16, color: AppColors.textColor),
//               ),
//             ),
//           ),
//           GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4, childAspectRatio: 1.6),
//               itemCount: _months.length,
//               itemBuilder: (context, index) => InkWell(
//                     onTap: () => onSelected(index + 1),
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: selectedMonth == index + 1
//                               ? AppColors.lightGreen
//                               : Colors.transparent),
//                       child: Text(
//                         _months[index].substring(0, 3),
//                         style: Utilities.setTextStyle(16,
//                             fontWeight: FontWeight.w500,
//                             color: selectedMonth == index + 1
//                                 ? AppColors.white
//                                 : AppColors.greyTextColor),
//                       ),
//                     ),
//                   ))
//         ],
//       ),
//     );
//   }
// }
