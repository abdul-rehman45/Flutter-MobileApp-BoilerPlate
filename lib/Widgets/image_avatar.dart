import 'package:flutter/material.dart';
import 'package:flutterproject/Constant/app_assets.dart';
import 'package:flutterproject/Constant/app_colors.dart';
import 'package:flutterproject/Utilities/utilities.dart';

class ImageAvatar extends StatelessWidget {
  ImageAvatar({
    Key? key,
    this.image,
    this.name,
    this.size = 30,
    this.iconTap,
    this.onImageTap,
    this.isNetwork = true,
    this.showCamera = false,
    this.showDelete = false,
    this.isSelected = false,
    this.isChat = false,
    this.isOnline = false,
  }) : super(key: key);
  final double size;
  String? image, name;
  final VoidCallback? iconTap, onImageTap;

  final bool isNetwork;
  final bool showCamera;
  final bool isSelected;
  final bool showDelete;
  final bool isChat;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Center(
                child: GestureDetector(
                  onTap: onImageTap,
                  child: image != null
                      ? Container(
                          height: size,
                          width: size,
                          decoration: BoxDecoration(
                            color: AppColors.iconBgColor,
                            //color: Color.alphaBlend(AppColors.bgColor, Colors.grey),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  // image != null
                                  // ?
                                  NetworkImage(image!),
                              // : Image.asset(
                              //     AppIcons.buddyLogo,
                              //   ).image,
                              fit: BoxFit.cover,
                            ),
                            border: isSelected
                                ? Border.all(
                                    color: AppColors.lightGreen, width: 4)
                                : null,
                          ),
                          // child: image != null
                          //     ? Image.network(image!)
                          //     : Image.asset(AppIcons.buddyLogo),
                        )
                      : CircleAvatar(
                          radius: size / 2,
                          backgroundColor: AppColors.iconBgColor,
                          child: Image.asset(
                            AppIcons.appLogo,
                            //height: 25,
                          ),
                        ),
                ),
              ),
            ),
            if (showCamera)
              // Positioned(
              //   bottom: 5,
              //   // right: -40,
              //   // left: 50,
              //   left: AppGlobals.screenWidth * 0.56,
              //   child: ImagePickerDialogItem(
              //     width: 40,
              //     image: AppIcons.camera,
              //     isNetwork: false,
              //     withtitle: false,
              //     onTap: iconTap,
              //   ),
              // ),
              if (showDelete)
                Positioned(
                  top: -5,
                  right: -10,
                  left: 50,
                  child: InkWell(
                    onTap: iconTap,
                    child: Container(
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconBgColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
            if (isChat)
              Positioned(
                bottom: 2,
                right: -(size / 4),
                left: size / 2,
                child: Container(
                  height: size / 4,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isOnline
                          ? AppColors.onlineColor
                          : AppColors.oflineColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (name != null)
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.only(left: 5),
              width: size,
              child: Text(
                "$name",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Utilities.setTextStyle(14,
                    color: AppColors.textColor, fontWeight: FontWeight.w400),
              ),
            ),
          ),
      ],
    );

    // child: isNetwork
    //     ? CircleAvatar(
    //         radius: size,
    //         backgroundImage: NetworkImage(
    //           image ?? AppImages.defaultDog,
    //         ),
    //       )
    //     : CircleAvatar(
    //         radius: size,
    //         backgroundImage: AssetImage(image ?? ''),
    //       ),
  }
}
