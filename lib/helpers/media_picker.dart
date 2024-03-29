import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants/colors.dart';
import '../services/permission_service/permission_service.dart';

class ImagePickerHelper {
  static Future<File?> pickImage({required bool isCamera}) async {
    ImagePicker imagePicker = ImagePicker();
    File? imageFile;
    XFile? pickedFile;

    bool permissionAllowed = await PermissionService.permission(
        permission: isCamera == true
            ? Permission.camera
            : Platform.isIOS
                ? Permission.photos
                : Permission.storage);
    if (permissionAllowed == true) {
      pickedFile = await imagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );
    }
    //else {}

    if (pickedFile != null) {
      imageFile = await _cropImage(pickedFile);
    }
    return imageFile;
  }

  static Future<File?> _cropImage(XFile? pickedFile) async {
    if (pickedFile == null) return null;

    File? imageFile;

    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.primary,
          toolbarWidgetColor: AppColors.white,
          activeControlsWidgetColor: AppColors.text,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Cropper'),
      ],
    );

    if (croppedFile != null) {
      File? file = File(croppedFile.path);
      imageFile = file;
    }
    return imageFile;
  }
}
