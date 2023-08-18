import 'package:flutter/material.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

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
  @override
  Widget build(BuildContext context) {
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
      automaticallyImplyLeading: false,
      title: Text(
        title ?? "",
        style: Helper.textStyle(
            color: contentColor, fontWeight: FontWeight.w600, fontSize: 14),
      ),
      leading: leadingIcon != null
          ? InkWell(
              onTap: onLeadingTap,
              child: Image.asset(
                leadingIcon ?? "",
                color: contentColor,
                scale: 4,
              ))
          : const SizedBox.shrink(),
      actions: [
        actionIcon != null
            ? InkWell(
                onTap: onActionTap,
                child: Image.asset(
                  actionIcon ?? "",
                  color: contentColor,
                  scale: 4,
                ))
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _backBar() {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.sp))),
      backgroundColor: color,
      foregroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        title ?? "",
        style: Helper.textStyle(
            color: contentColor, fontWeight: FontWeight.w600, fontSize: 14),
      ),
      leading:
          InkWell(onTap: () => Get.back(), child: const Icon(Icons.arrow_back)),
      actions: [
        actionIcon != null
            ? InkWell(
                onTap: onActionTap,
                child: Image.asset(
                  actionIcon ?? "",
                  color: contentColor,
                  scale: 4,
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
