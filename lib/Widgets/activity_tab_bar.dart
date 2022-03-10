import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class ActivityTabBar extends StatelessWidget {
  const ActivityTabBar({Key? key, this.selectedIndex = 0, required this.onTap})
      : super(key: key);

  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: AppColors.lightBlue,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: _menuItem('DAY', 0),
              ),
              Expanded(
                child: _menuItem('WEEK', 1),
              ),
              Expanded(
                child: _menuItem('MONTH', 2),
              ),
            ],
          ),
        ),
        AnimatedPositioned(
          left: _tabPosition(),
          child: Container(
            height: 35,
            // uncoment karna ha
            // width: AppGlobals.screenWidth / 3.33,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.lightGreen),
            child: Center(
              child: Text(
                selectedIndex == 0
                    ? "DAY"
                    : selectedIndex == 1
                        ? 'WEEK'
                        : 'MONTH',
                style: Utilities.setTextStyle(14,
                    fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ),
          duration: Duration(milliseconds: 400),
        ),
      ],
    );
  }

  Widget _menuItem(String title, int index) => InkWell(
        onTap: () => onTap(index),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Utilities.setTextStyle(
            14,
            fontWeight: FontWeight.w600,
            color: selectedIndex == index
                ? Colors.transparent
                : AppColors.greyTextColor,
          ),
        ),
      );

  double _tabPosition() {
    switch (selectedIndex) {
      case 0:
        return 0;
      case 1:
      // return AppGlobals.screenWidth / 3.3;
      case 2:
      // return AppGlobals.screenWidth / 1.64;
      default:
        return 0;
    }
  }
}
