import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Widgets/gradient_text.dart';

class GradientIconButton extends StatelessWidget {
  const GradientIconButton(
      {Key? key,
      required this.title,
      this.isGradient = true,
      required this.onTap,
      required this.iconData})
      : super(key: key);

  final String title;
  final bool isGradient;
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.g5Color,
              AppColors.g3Color,
            ],
          ),
        ),
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isGradient ? Colors.transparent : AppColors.dialogColor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText(
                  title.toUpperCase(),
                  gradient: isGradient
                      ? LinearGradient(colors: [Colors.white, Colors.white])
                      : LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            AppColors.g5Color,
                            AppColors.g3Color,
                          ],
                        ),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 10),
                Icon(
                  iconData,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
