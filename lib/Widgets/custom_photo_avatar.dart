import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_assets.dart';
import 'package:flutterproject/Constant/app_colors.dart';

class CustomPhotoAvatar extends StatelessWidget {
  const CustomPhotoAvatar({
    Key? key,
    this.iconPath,
    this.isSelected = false,
    required this.onTap,
    this.isEdit = false,
    this.onEditTap,
    this.assetsCall = true,
    this.addImageShowCall = false,
    this.file,
    this.onDelete,
  }) : super(key: key);

  final String? iconPath;
  final bool isSelected, isEdit;
  final VoidCallback onTap;
  final VoidCallback? onEditTap, onDelete;
  final bool? assetsCall;
  final bool? addImageShowCall;
  final File? file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: AppColors.lightGreen, width: 4)
                        : null),
                child: Center(
                  child: addImageShowCall == true && file != null
                      ? InkWell(
                          onTap: onEditTap,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.iconBgColor,
                            backgroundImage: FileImage(file!),
                          ),
                        )
                      : iconPath != null && iconPath != ""
                          ? assetsCall == true
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.iconBgColor,
                                  backgroundImage: AssetImage(iconPath!),
                                )
                              : InkWell(
                                  onTap: onEditTap,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColors.iconBgColor,
                                    backgroundImage: NetworkImage(iconPath!),
                                  ),
                                )
                          : InkWell(
                              onTap: onEditTap,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.iconBgColor,
                                child: Image.asset(
                                  AppIcons.appLogo,
                                  height: 25,
                                ),
                              ),
                            ),
                ),
              ),
              // if (isEdit == true &&
              //     ((addImageShowCall == true && file != null) ||
              //         (iconPath != null && iconPath != "")))
              //   Positioned(
              //     // bottom: 5,
              //     // // right: -40,
              //     // // left: 50,
              //     left: AppGlobals.screenWidth * 0.12,
              //     child: ImagePickerDialogItem(
              //       width: 25,
              //       image: AppIcons.delete,
              //       isNetwork: false,
              //       withtitle: false,
              //       onTap: onDelete,
              //     ),
              //   ),
            ],
          ),
          SizedBox(height: 8),
          // addImageShowCall == true
          //     ? SizedBox.shrink()
          //     : InkWell(
          //         onTap: onTap,
          //         child: CustomRadioButton(
          //           size: 18,
          //           isMarked: isSelected,
          //         ),
          //       ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
