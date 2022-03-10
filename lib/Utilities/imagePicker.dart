import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Imagepicker {
  Future pickImage(bool isCamera, BuildContext context) async {
    ImagePicker picker = ImagePicker();
    try {
      //picker._pickImage(isCamera);
      var pickedFile = await picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);

      if (pickedFile != null) {
        File image = File(pickedFile.path);
        //crop image
        // await _cropImage(image);
        // print(image);
        return image;
      }
    } catch (e) {
      print("ImagePicker error...");
      print(e.toString());
    }
  }

  /// Crop Image
  // Future<void> _cropImage(File imageFile,BuildContext context) async {
  //   try {

  //     File? croppedFile = await ImageCropper.cropImage(
  //       sourcePath: imageFile.path,
  //       // cropStyle: CropStyle.rectangle,
  //       //  aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
  //       aspectRatioPresets: // [CropAspectRatioPreset.square],
  //           Platform.isAndroid
  //               ? [
  //                   CropAspectRatioPreset.square,
  //                   CropAspectRatioPreset.ratio3x2,
  //                   CropAspectRatioPreset.original,
  //                   CropAspectRatioPreset.ratio4x3,
  //                   CropAspectRatioPreset.ratio16x9
  //                 ]
  //               : [
  //                   CropAspectRatioPreset.original,
  //                   CropAspectRatioPreset.square,
  //                   CropAspectRatioPreset.ratio3x2,
  //                   CropAspectRatioPreset.ratio4x3,
  //                   CropAspectRatioPreset.ratio5x3,
  //                   CropAspectRatioPreset.ratio5x4,
  //                   CropAspectRatioPreset.ratio7x5,
  //                   CropAspectRatioPreset.ratio16x9
  //                 ],
  //       androidUiSettings: AndroidUiSettings(
  //         toolbarTitle: 'Crop Image',
  //         toolbarColor: Colours.yormGreen,
  //         toolbarWidgetColor: Colors.white,
  //         activeControlsWidgetColor: Colours.yormOrange,
  //         initAspectRatio: CropAspectRatioPreset.square,
  //         lockAspectRatio: false,
  //       ),
  //       iosUiSettings: IOSUiSettings(title: 'Crop Image'),
  //     );

  //     if (croppedFile != null) {
  //       if (await internetConnectivity.checkInternet(context)) {
  //         progressDialog = ProgressDialog(
  //           context,
  //           title: Text("Uploading Image"),
  //           message: Text("Please wait.."),
  //         );
  //         progressDialog.show();

  //         var res = await ApiServices().uploadPhoto(croppedFile);

  //         if (res != null) {
  //           var ires = await ApiServices()
  //               .updateUserName(globals.userName, res.fileDownloadUri);

  //           if (ires != null) {
  //             progressDialog.dismiss();
  //             _saveImageUrl(res.fileDownloadUri);
  //             setState(() {
  //               image = File(croppedFile.path);
  //             });
  //           } else {
  //             // globals.profileImageUrl = null;
  //             progressDialog.dismiss();
  //           }
  //         } else {
  //           // globals.profileImageUrl = null;
  //           progressDialog.dismiss();
  //         }
  //       }
  //     } else {
  //       return;
  //     }
  //   } catch (e) {
  //     print('Image cropper err: $e');
  //   }
  // }
}
