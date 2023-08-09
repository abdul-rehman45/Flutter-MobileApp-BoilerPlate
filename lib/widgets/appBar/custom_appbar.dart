import 'package:flutter/material.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../common/custom_asset_image.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
      this.title,
      this.leadingIcon,
      this.actionIcon,
      this.color,
      this.onLeadingTap,
      this.onActionTap,
      this.showBack = true,
      this.isAppBar = true});
  final String? title, leadingIcon, actionIcon;
  final bool showBack, isAppBar;
  final Color? color;
  final VoidCallback? onLeadingTap, onActionTap;
  late Color contentColor;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.sp);
  //throw UnimplementedError();
  @override
  Widget build(BuildContext context) {
    //contentColor = color == darkGrey ? white : darkGrey;
    return PreferredSize(
        preferredSize: preferredSize,
        child: isAppBar != true ? _backBar() : _appBar());
  }

  Widget _appBar() {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.sp))),
      backgroundColor: color,
      foregroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      //toolbarHeight: 50.sp,
      automaticallyImplyLeading: false,
      title: Text(
        title ?? "",
        style: Helper.textStyle(
            color: contentColor, fontWeight: FontWeight.w600, fontSize: 14),
      ),
      //leadingWidth: 20.sp,

      leading: leadingIcon != null
          ? InkWell(
              onTap: onLeadingTap,
              child: Image.asset(
                leadingIcon ?? "",
                color: contentColor,
                scale: 4,
              ))
          : SizedBox.shrink(),
      actions: [
        actionIcon != null
            ? InkWell(
                onTap: onActionTap,
                child: Image.asset(
                  actionIcon ?? "",
                  color: contentColor,
                  scale: 4,
                ))
            : SizedBox.shrink(),
      ],
      //actions: CustomAssetImage(image: leadingIcon),
    );
  }

  Widget _backBar() {
    return Padding(
      padding: EdgeInsets.only(left: 10.sp, top: 30.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBack)
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  width: 25.sp,
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: const CustomAssetImage(
                      image: AppIcons.backIcon,
                    ),
                  ),
                ),
              ),
            ),
          if (title != null)
            Text(
              title ?? '',
              style: Helper.textStyle(
                fontSize: 18,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
