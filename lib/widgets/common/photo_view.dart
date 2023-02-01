// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Utilities/utilities.dart';
// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// class CustomPhotoView extends StatelessWidget {
//   const CustomPhotoView({Key? key, required this.image, this.title})
//       : super(key: key);
//   final String? image, title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: AppColors.textColor),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.of(context, rootNavigator: true).pop();
//           },
//         ),
//         title: Text(
//           title ?? 'You',
//           style: Utilities.setTextStyle(16,
//               color: AppColors.textColor, fontWeight: FontWeight.w500),
//         ),
//         backgroundColor: AppColors.bgColor,
//       ),
//       body: Container(
//         child: PhotoView(
//           initialScale: PhotoViewComputedScale.contained,
//           minScale: PhotoViewComputedScale.contained * 0.8,
//           maxScale: PhotoViewComputedScale.covered * 2,
//           imageProvider: NetworkImage(image!),
//         ),
//       ),
//     );
//   }
// }

// class CustomGalleryView extends StatelessWidget {
//   const CustomGalleryView({
//     Key? key,
//     this.backgroundDecoration,
//     required this.images,
//     this.onPageChanged,
//     this.title,
//     this.initialIndex = 0,
//     this.pageController,
//   }) : super(key: key);

//   final BoxDecoration? backgroundDecoration;
//   final PageController? pageController;
//   final Function(int)? onPageChanged;
//   final List? images;
//   final String? title;
//   final int initialIndex;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: AppColors.textColor),
//         title: Text(
//           title ?? 'You',
//           style: Utilities.setTextStyle(16,
//               color: AppColors.textColor, fontWeight: FontWeight.w500),
//         ),
//         backgroundColor: AppColors.bgColor,
//       ),
//       body: images != null
//           ? Container(
//               child: PhotoViewGallery.builder(
//                 itemCount: images!.length,
//                 backgroundDecoration: backgroundDecoration,
//                 onPageChanged: onPageChanged,
//                 scrollPhysics: const BouncingScrollPhysics(),
//                 pageController: PageController(initialPage: initialIndex),
//                 builder: (BuildContext context, int index) {
//                   return PhotoViewGalleryPageOptions(
//                     imageProvider: NetworkImage(images![index]),
//                     initialScale: PhotoViewComputedScale.contained,
//                     minScale: PhotoViewComputedScale.contained * 0.8,
//                     maxScale: PhotoViewComputedScale.covered * 2,
//                     // heroAttributes:PhotoViewHeroAttributes(tag: images![index]),
//                   );
//                 },
//                 loadingBuilder: (context, event) => Center(
//                   child: Container(
//                     width: 20.0,
//                     height: 20.0,
//                     child: CircularProgressIndicator(
//                       value: event == null
//                           ? 0
//                           : event.cumulativeBytesLoaded /
//                               (event.expectedTotalBytes ?? 1),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           : Container(),
//     );
//   }
// }
