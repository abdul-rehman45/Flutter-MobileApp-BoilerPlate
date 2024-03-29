import 'package:flutter/material.dart';
import 'package:flutterproject/helpers/helpers.dart';
import 'package:sizer/sizer.dart';
import '../../constants/assets.dart';
import '../../constants/colors.dart';

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
            icon: AppIcons.homeOutlineIcon,
            selectedIcon: AppIcons.homeIcon,
            //label: home,
          ),
          _destinationItem(
            icon: AppIcons.favoriteOutlineIcon,
            selectedIcon: AppIcons.favoriteIcon,
            // label: favorites,
          ),
          _destinationItem(
            icon: AppIcons.gridOutlineIcon,
            selectedIcon: AppIcons.gridIcon,
            // label: AppTexts.categories,
          ),
          _destinationItem(
            icon: AppIcons.cartOutlineIcon,
            selectedIcon: AppIcons.cartIcon,
            // label: AppTexts.cart,
          ),
          _destinationItem(
            icon: AppIcons.avatarOutlineIcon,
            selectedIcon: AppIcons.avatarIcon,
            // label: AppTexts.account,
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
