import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/texts.dart';
import 'package:flutterproject/constant/assets.dart';
import 'package:flutterproject/constant/colors.dart';
import 'package:flutterproject/helpers/ui_helpers.dart';

import 'package:sizer/sizer.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key, this.onChanged, this.index = 0});

  final void Function(int)? onChanged;
  final int index;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.all(
          Helper.textStyle(
            fontSize: 10,
            color: AppColors.textLightGrey,
          ),
        ),
      ),
      child: NavigationBar(
        height: 60.sp,
        elevation: 6.sp,
        backgroundColor: AppColors.white,
        animationDuration: const Duration(milliseconds: 600),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: index,
        onDestinationSelected: onChanged,
        destinations: [
          _destinationItem(
            icon: AppIcons.homeOutline,
            selectedIcon: AppIcons.home,
            label: AppTexts.home,
          ),
          _destinationItem(
            icon: AppIcons.favoriteOutline,
            selectedIcon: AppIcons.favorite,
            label: AppTexts.favorites,
          ),
          _destinationItem(
            icon: AppIcons.gridOutline,
            selectedIcon: AppIcons.grid,
            label: AppTexts.categories,
          ),
          _destinationItem(
            icon: AppIcons.cartOutline,
            selectedIcon: AppIcons.cart,
            label: AppTexts.cart,
          ),
          _destinationItem(
            icon: AppIcons.avatarOutline,
            selectedIcon: AppIcons.avatar,
            label: AppTexts.account,
          ),
        ],
      ),
    );
    // return CurvedNavigationBar(
    //   color: AppColors.primary,
    //   backgroundColor: AppColors.scaffold,
    //   buttonBackgroundColor: AppColors.scaffold,
    //   index: index,
    //   onTap: onChanged,
    //   items: [
    //     _navItem(0, AppIcons.home, currentIndex: index),
    //     _navItem(1, AppIcons.cart, currentIndex: index),
    //     _navItem(2, AppIcons.grid, currentIndex: index),
    //     _navItem(3, AppIcons.avatar, currentIndex: index),
    //   ],
    // );
  }

  NavigationDestination _destinationItem(
      {required String icon, String? selectedIcon, String? label}) {
    return NavigationDestination(
      selectedIcon: _navItem(selectedIcon ?? icon, isSelected: true),
      icon: _navItem(icon),
      label: label ?? '',
    );
  }

  Widget _navItem(String icon, {bool? isSelected}) {
    const double iconSize = 18;
    return Image.asset(
      icon,
      height: iconSize.sp,
      // color: isSelected == true ? AppColors.primary : AppColors.black,
    );
  }
}
