import 'package:flutter/material.dart';
import 'package:flutterproject/constants/texts.dart';
import 'package:flutterproject/helpers/helpers.dart';

import '../../constants/colors.dart';

class CustomMediaPickerBottomSheet {
  static Future<String?> mediaOption(BuildContext context) async {
    String? isSave = await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.selectMediaType,
                    style: Helper.textStyle(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _imageIconWidget(context,
                          iconData: Icons.image,
                          title: AppTexts.image, onTap: () {
                        Navigator.of(context).pop("image");
                      }),
                      const SizedBox(width: 20),
                      _imageIconWidget(context,
                          iconData: Icons.video_file,
                          title: AppTexts.video, onTap: () {
                        Navigator.of(context).pop("video");
                      }),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
    return isSave;
  }

  static Future<String?> sourceOption(
    BuildContext context,
  ) async {
    String? isSave = await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.selectMediaSource,
                    style: Helper.textStyle(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _imageIconWidget(context,
                          iconData: Icons.camera_indoor,
                          title: AppTexts.camera, onTap: () {
                        Navigator.of(context).pop("camera");
                      }),
                      const SizedBox(width: 20),
                      _imageIconWidget(context,
                          iconData: Icons.storage,
                          title: AppTexts.gallery, onTap: () {
                        Navigator.of(context).pop("gallery");
                      }),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
    return isSave;
  }

  static Widget _imageIconWidget(BuildContext context,
      {required IconData iconData, String? title, VoidCallback? onTap}) {
    double iconSize = 35;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CircleAvatar(
            radius: iconSize,
            backgroundColor: AppColors.primary,
            child: Icon(
              iconData,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
        Text(
          title ?? "",
          style: Helper.textStyle(),
        )
      ],
    );
  }
}
