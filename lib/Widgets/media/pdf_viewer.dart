// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

// class PdfViewerScreen extends StatelessWidget {
//   const PdfViewerScreen({this.title, this.pdfUrl, super.key});
//   final String? pdfUrl, title;
//   @override
//   Widget build(BuildContext context) {
//     return CrisisButtonLayout(
//       child: Scaffold(
//         backgroundColor: AppColors.white,
//         body: Padding(
//           padding: const EdgeInsets.only(top: 8),
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               TopBar(text: title ?? "", showBackButton: true),
//               Expanded(
//                 child: const PDF().cachedFromUrl(
//                     //"http://africau.edu/images/default/sample.pdf",
//                     pdfUrl ?? "", placeholder: (progress) {
//                   return Center(child: Text('$progress %'));
//                 }, errorWidget: (error) {
//                   return Center(child: Text(error.toString()));
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
