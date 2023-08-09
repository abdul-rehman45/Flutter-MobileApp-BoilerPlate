import 'package:flutter/material.dart';
import 'package:flutterproject/widgets/common/count_circle.dart';
import '../../constants/colors.dart';
import '../../helpers/helpers.dart';

class CustomPopUpMenu extends StatefulWidget {
  const CustomPopUpMenu({
    Key? key,

    // this.cartCount,
    // this.wishListCount,
    required this.onSelected,
    required this.popupItems,
  }) : super(key: key);
  // int? cartCount, wishListCount;

  final Function(Object?)? onSelected;
  final List? popupItems;

  @override
  _CustomPopUpMenuState createState() => _CustomPopUpMenuState();
}

class _CustomPopUpMenuState extends State<CustomPopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 17,
      height: 25,
      child: Center(
        child: PopupMenuButton(
          padding: EdgeInsets.zero,
          color: AppColors.bgColor,
          icon: Icon(
            Icons.more_vert,
            color: AppColors.bgColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          itemBuilder: (context) {
            if (widget.popupItems != null) {
              return [
                for (int i = 0; i < widget.popupItems!.length; i++)
                  PopupMenuItem(
                    value: widget.popupItems![i]['value'],
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              widget.popupItems![i]['icon'],
                              height: 18,
                              width: 18,
                              fit: BoxFit.contain,
                              color: i == widget.popupItems!.length - 1
                                  ? AppColors.primary
                                  : AppColors.text,
                            ),
                            SizedBox(width: 6),
                            Text(
                              widget.popupItems![i]['value'],
                              style: Helper.textStyle(
                                fontSize: 14,
                                color: i == widget.popupItems!.length - 1
                                    ? AppColors.primary
                                    : AppColors.text,
                              ),
                            ),
                            Spacer(),
                            widget.popupItems![i]['count'] != null
                                ? CountCircle(
                                    size: 24,
                                    count: widget.popupItems![i]['count'])
                                : Container(),
                          ],
                        ),
                        if (widget.popupItems!.length > 1 &&
                            i == widget.popupItems!.length - 2)
                          Column(
                            children: [
                              SizedBox(height: 12),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: AppColors.grey,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                // PopupMenuItem(
                //   value: 'wishlist',
                //   child: Column(
                //     children: [
                //       Row(
                //         children: [
                //           Icon(
                //             Icons.favorite_border,
                //             color: AppColors.textColor,
                //             size: 20,
                //           ),
                //           SizedBox(width: 6),
                //           Text(
                //             'Wishlist',
                //             style: Utilities.setTextStyle(
                //               14,
                //               color: AppColors.textColor,
                //             ),
                //           ),
                //           Spacer(),
                //           CountCircle(
                //             size: 24,
                //             count: widget.wishListCount,
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 12),
                //       Divider(
                //         height: 1,
                //         thickness: 1,
                //         color: AppColors.lightBlue,
                //       ),
                //     ],
                //   ),
                // ),
                // PopupMenuItem(
                //   value: 'delete',
                //   child: Row(
                //     children: [
                //       Image.asset(
                //         AppIcons.delete,
                //         color: Colors.red,
                //         height: 18,
                //         width: 18,
                //         fit: BoxFit.contain,
                //       ),
                //       SizedBox(width: 6),
                //       Text(
                //         'Delete All',
                //         style: Utilities.setTextStyle(
                //           14,
                //           color: Colors.red,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ];
            } else {
              return [PopupMenuItem(child: Container())];
            }
          },
          onSelected: (value) {
            // print("$value");
            if (widget.onSelected != null) {
              widget.onSelected!(value);
            }
          },
        ),
      ),
    );
  }
}
