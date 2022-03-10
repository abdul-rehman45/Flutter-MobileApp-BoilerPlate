import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Constant/globals.dart';
import 'package:flutterproject/Utilities/utilities.dart';
import 'package:flutterproject/Widgets/image_avatar.dart';

class CustomSimpleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomSimpleAppBar({
    this.title,
    this.height = 70,
    this.iconPath,
    this.iconPath2,
    this.iconTap,
    this.iconTap2,
    this.action,
    this.showBack = true,
    this.onBackTap,
    this.backIconColor,
    this.isOnline,
    this.showProfile,
    this.profileImage,
    this.wishListCount,
    this.appBarTextColor,
  });
  final String? title, iconPath, iconPath2, profileImage;
  final double height;
  final VoidCallback? iconTap, onBackTap, iconTap2;
  final Color? backIconColor;
  final Color? appBarTextColor;
  final bool? showBack, showProfile, isOnline;
  final Widget? action;
  int? wishListCount;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: EdgeInsets.symmetric(horizontal: 18),
      color: Colors.transparent,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Back Button icon
            showBack == true
                ? InkWell(
                    onTap: onBackTap ?? () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(1, 8, 8, 8),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: backIconColor ?? AppColors.textColor,
                      ),
                    ),
                  )
                : Container(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (showProfile ?? false)
                  ImageAvatar(
                    size: AppGlobals.screenWidth * 0.08,
                    isOnline: isOnline ?? false,
                    isChat: true,
                    isNetwork: true,
                    image: profileImage,
                  ),
                SizedBox(width: 8),
                Text(
                  title ?? '',
                  textAlign: TextAlign.center,
                  style: Utilities.setTextStyle(
                    18,
                    fontWeight: FontWeight.w500,
                    color: appBarTextColor ?? AppColors.textColor,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (iconPath2 != null)
                  InkWell(
                    onTap: iconTap2,
                    child: Image.asset(
                      iconPath2 ?? '',
                      height: 24,
                      width: 24,
                    ),
                  ),
                SizedBox(width: 8),
                // action icon
                action ??
                    (iconPath != null
                        ? InkWell(
                            onTap: iconTap,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  iconPath ?? '',
                                  height: 24,
                                  width: 24,
                                ),
                                if (wishListCount != null)
                                  Text(
                                    wishListCount.toString(),
                                    style: Utilities.setTextStyle(11,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white),
                                  ),
                              ],
                            ),
                          )
                        : Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
