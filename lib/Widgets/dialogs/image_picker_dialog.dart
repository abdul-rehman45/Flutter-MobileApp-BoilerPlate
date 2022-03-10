// import 'dart:io';
// import 'dart:ui';

// import 'package:buddytobody/Apis/Functions/post_single_image_controller.dart';
// import 'package:buddytobody/Apis/GetxControllers/ImageController/addPetImageController.dart';
// import 'package:buddytobody/Apis/GetxControllers/ImageController/imageController.dart';
// import 'package:buddytobody/Apis/GetxControllers/ImageController/petImageController.dart';
// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Constants/globals.dart';
// import 'package:buddytobody/Services/nav_bar_service.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutterproject/Constant/app_assets.dart';
// import 'package:flutterproject/Constant/app_colors.dart';
// import 'package:flutterproject/Utilities/utilities.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class ImagePickerDialog extends StatelessWidget {
//   ImagePickerDialog(
//       {Key? key,
//       this.name,
//       this.selectedIndex = 0,
//       this.singleImage = true,
//       this.petImagePicker = false,
//       this.petId,
//       this.addImageCall = false})
//       : super(key: key);
//   final String? name;
//   final int? selectedIndex;
//   final bool? singleImage;
//   final bool? petImagePicker;
//   final int? petId;
//   final bool? addImageCall;

//   final ImagePicker _imagePicker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return BackdropFilter(
//       filter: ImageFilter.blur(
//         sigmaX: 5.0,
//         sigmaY: 5.0,
//       ),
//       child: AlertDialog(
//         insetPadding: EdgeInsets.all(16),
//         contentPadding: EdgeInsets.all(10),
//         backgroundColor: AppColors.dialogColor,
//         // clipBehavior: Clip.antiAliasWithSaveLayer,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(18.0),
//           ),
//         ),
//         content: Container(
//           height: AppGlobals.screenHeight * 0.4,
//           width: AppGlobals.screenWidth - 20,
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.centerRight,
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(Icons.close, color: AppColors.textColor),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Please select ${name ?? ''} photo",
//                       style: Utilities.setTextStyle(16,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.textColor),
//                     ),
//                     SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ImagePickerDialogItem(
//                           withtitle: true,
//                           isNetwork: false,
//                           image: AppIcons.cameraOutline,
//                           title: "Camera",
//                           width: AppGlobals.screenWidth * 0.3,
//                           onTap: () {
//                             _pickImage(context, isCamera: true);
//                           },
//                         ),
//                         SizedBox(width: 20),
//                         ImagePickerDialogItem(
//                           withtitle: true,
//                           isNetwork: false,
//                           image: AppIcons.gallery,
//                           title: "Gallery",
//                           width: AppGlobals.screenWidth * 0.3,
//                           onTap: () {
//                             _pickImage(context, isCamera: false);
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         for (int index = 0; index < 2; index++)
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 2),
//                             child: Image.asset(
//                               AppIcons.bone,
//                               width: 22,
//                               color: index == selectedIndex
//                                   ? AppColors.lightGreen
//                                   : AppColors.tfBorder,
//                             ),
//                           ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<Null> _pickImage(BuildContext context, {bool? isCamera}) async {
//     try {
//       Navigator.pop(context);

//       XFile? pickedFile = await _imagePicker.pickImage(
//         source: isCamera ?? false ? ImageSource.camera : ImageSource.gallery,
//         imageQuality: 80,
//       );
//       File? _pickedImage = pickedFile != null ? File(pickedFile.path) : null;
//       if (_pickedImage != null) {
//         _cropImage(_pickedImage);
//       } else {
//         return;
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<Null> _cropImage(File imageFile) async {
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
//         toolbarColor: AppColors.lightGreen,
//         toolbarWidgetColor: Colors.white,
//         activeControlsWidgetColor: AppColors.lightGreen,
//         initAspectRatio: CropAspectRatioPreset.square,
//         lockAspectRatio: false,
//       ),
//       iosUiSettings: IOSUiSettings(title: 'Crop Image'),
//     );

//     if (croppedFile != null) {
//       final imageController = Get.find<ImageController>();
//       final petImageController = Get.find<PetImageController>();
//       final addPetImageController = Get.find<AddPetImageController>();

//       // setState(() {
//       // AppGlobals.firstName = croppedFile.path;
//       // PostSingleImageProvider().postImage(
//       //   image: croppedFile.path,
//       //   index: 0,
//       // );
//       // });
//       if (addImageCall == true) {
//         addPetImageController.petUploadImage(
//           image: croppedFile,
//           index: selectedIndex!,
//         );
//         return;
//       } else if (petImagePicker == true) {
//         petImageController.petUploadImage(
//             image: croppedFile.path,
//             index: selectedIndex!,
//             singleImage: singleImage,
//             petId: petId!);
//         return;
//       } else {
//         imageController.uploadImage(
//             image: croppedFile.path,
//             index: selectedIndex!,
//             singleImage: singleImage);
//         return;
//       }
//     } else {
//       return;
//     }
//   }
// }

// class ImagePickerDialogItem extends StatelessWidget {
//   ImagePickerDialogItem(
//       {Key? key,
//       this.image,
//       this.title,
//       this.onTap,
//       this.withtitle,
//       this.width = 50,
//       this.isNetwork = true})
//       : super(key: key);

//   String? title, image;
//   VoidCallback? onTap;
//   double width = 50;
//   bool? withtitle, isNetwork;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: width,
//             padding: EdgeInsets.all(width / 4),
//             decoration: BoxDecoration(
//               color: AppColors.lightGreen,
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: (isNetwork ?? true)
//                   ? Image.network(
//                       image ?? AppImages.defaultDog,
//                       fit: BoxFit.contain,
//                     )
//                   : Image.asset(
//                       image ?? AppIcons.gallery,
//                       fit: BoxFit.contain,
//                     ),
//             ),
//           ),
//           if (withtitle ?? false)
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Text(
//                 title ?? '',
//                 style: Utilities.setTextStyle(14,
//                     fontWeight: FontWeight.w500, color: AppColors.textColor),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
