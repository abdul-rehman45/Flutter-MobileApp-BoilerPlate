import 'dart:io';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../helpers/helpers.dart';

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
                        ? Border.all(color: AppColors.green, width: 4)
                        : null),
                child: Center(
                  child: addImageShowCall == true && file != null
                      ? InkWell(
                          onTap: onEditTap,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.bgColor,
                            backgroundImage: FileImage(file!),
                          ),
                        )
                      : iconPath != null && iconPath != ""
                          ? assetsCall == true
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.bgColor,
                                  backgroundImage: AssetImage(iconPath!),
                                )
                              : InkWell(
                                  onTap: onEditTap,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: AppColors.bgColor,
                                    backgroundImage: NetworkImage(iconPath!),
                                  ),
                                )
                          : InkWell(
                              onTap: onEditTap,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.bgColor,
                                // child: Image.asset(
                                //   AppIcons.appLogo,
                                //   height: 25,
                                // ),
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

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({
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
  final String? image, name;
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
                            color: AppColors.bgColor,
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
                                ? Border.all(color: AppColors.green, width: 4)
                                : null,
                          ),
                          // child: image != null
                          //     ? Image.network(image!)
                          //     : Image.asset(AppIcons.buddyLogo),
                        )
                      : CircleAvatar(
                          radius: size / 2,
                          backgroundColor: AppColors.bgColor,
                          // child: Image.asset(
                          //   AppIcons.appLogo,
                          //   //height: 25,
                          // ),
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
                        color: AppColors.bgColor,
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
                      color: isOnline ? AppColors.bgColor : AppColors.bgColor,
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
                style: Helper.textStyle(
                    fontSize: 14,
                    color: AppColors.text,
                    fontWeight: FontWeight.w400),
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

// class CustomParentAvatar extends StatelessWidget {
//   const CustomParentAvatar(
//       {Key? key,
//       required this.iconPath,
//       this.isSelected = false,
//       required this.onTap,
//       required this.title})
//       : super(key: key);

//   final String iconPath, title;
//   final bool isSelected;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: isSelected
//                     ? Border.all(color: AppColors.lightGreen, width: 3)
//                     : null),
//             child: Center(
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage(iconPath),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           CustomRadioButton(isMarked: isSelected),
//           SizedBox(height: 10),
//           Text(
//             title,
//             style: Utilities.setTextStyle(16),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.color, this.thickness, this.height});
  final Color? color;
  final double? thickness, height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 0,
      thickness: thickness ?? 0.3,
      color: color ?? AppColors.whiteShade,
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutterproject/constant/colors.dart';
// import 'package:flutterproject/constant/globals.dart';
// import 'package:flutterproject/helpers/ui_helpers.dart';

// import 'package:flutterproject/widgets/common/gradient_text.dart';

// class GraphContainer extends StatefulWidget {
//   GraphContainer({Key? key}) : super(key: key);

//   @override
//   State<GraphContainer> createState() => _GraphContainerState();
// }

// class _GraphContainerState extends State<GraphContainer> {
//   int _selectedBar = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18),
//               color: AppColors.graphBg,
//             ),
//             padding: EdgeInsets.only(left: 16, right: 16, top: 20),
//             alignment: Alignment.bottomCenter,
//             height: AppGlobals.screenHeight * 0.32,
//             width: AppGlobals.screenWidth,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 for (int i = 0; i <= 6; i++)
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       if (_selectedBar == i)
//                         GradientText(
//                           "${i * 200}",
//                           style: Utilities.setTextStyle(18,
//                               fontWeight: FontWeight.w600),
//                           gradient: LinearGradient(
//                             begin: Alignment.bottomLeft,
//                             end: Alignment.topRight,
//                             colors: [
//                               AppColors.g5Color,
//                               AppColors.g3Color,
//                             ],
//                           ),
//                         ),
//                       SizedBox(height: 10),
//                       _graphBar(i * 20, i),
//                     ],
//                   )
//               ],
//             )),
//         Padding(
//           padding: EdgeInsets.only(left: 16, right: 16, top: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               for (int i = 0; i <= 6; i++)
//                 Container(
//                   width: 28,
//                   child: Text(
//                     '18:00',
//                     style:
//                         Helper.textStyle(fontSize:10, color: AppColors.text),
//                   ),
//                 )
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _graphBar(double height, int index) => InkWell(
//         onTap: () {
//           setState(() => _selectedBar = index);
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 400),
//           width: 25,
//           height: height == 0 ? 8 : height,
//           // margin: EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(2),
//             gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: _selectedBar == index
//                   ? [
//                       AppColors.g5Color,
//                       AppColors.g3Color,
//                     ]
//                   : [
//                       AppColors.barColor.withOpacity(0.14),
//                       AppColors.barColor,
//                       AppColors.barColor,
//                     ],
//             ),
//           ),
//         ),
//       );
// }

