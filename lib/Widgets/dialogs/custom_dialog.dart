import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_assets.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Constant/globals.dart';
import 'package:flutterproject/Utilities/utilities.dart';
import 'package:flutterproject/Widgets/buttons/gradient_button.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      this.title = '',
      this.description = '',
      this.onLeftButtonTap,
      this.onRightButtonTap,
      this.onclosetap,
      this.iconPath,
      this.leftButtonTitle = '',
      this.rightButtonTitle = '',
      this.showButtons = true})
      : super(key: key);

  final String title, description, leftButtonTitle, rightButtonTitle;
  final String? iconPath;
  final VoidCallback? onLeftButtonTap, onRightButtonTap, onclosetap;
  final bool showButtons;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5.0,
        sigmaY: 5.0,
      ),
      child: AlertDialog(
        backgroundColor: AppColors.dialogColor,
        insetPadding: EdgeInsets.all(16),
        contentPadding: EdgeInsets.fromLTRB(20, showButtons ? 40 : 12, 20, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
        content: Container(
          // height: AppGlobals.screenHeight * 0.6,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              showButtons
                  ? SizedBox.shrink()
                  : Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(bottom: 28),
                      child: InkWell(
                        onTap: () {
                          if (onclosetap != null) {
                            onclosetap!();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Icon(Icons.close, color: AppColors.textColor),
                      ),
                    ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Utilities.setTextStyle(
                      16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Utilities.setTextStyle(
                      14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor,
                    ),
                  ),
                  SizedBox(height: 22),
                  Flexible(
                    child: Image.asset(
                      iconPath ?? AppImages.dialoglogo,
                      width: AppGlobals.screenWidth * 0.7,
                      height: AppGlobals.screenHeight * 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                  showButtons
                      ? Column(
                          children: [
                            SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(
                                  child: GradientButton(
                                    title: leftButtonTitle,
                                    isGradient: false,
                                    onTap: onLeftButtonTap ??
                                        () => Navigator.pop(context),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: GradientButton(
                                    title: rightButtonTitle,
                                    onTap: onRightButtonTap ??
                                        () => Navigator.pop(context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  // SizedBox(height: 20,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
