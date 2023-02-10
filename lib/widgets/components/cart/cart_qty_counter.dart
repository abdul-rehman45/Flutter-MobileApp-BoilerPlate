// import 'package:flutter/material.dart';
// import 'package:flutterproject/constant/colors.dart';
// import 'package:flutterproject/helpers/ui_helpers.dart';

// class CartQtyCounter extends StatefulWidget {
//   CartQtyCounter({Key? key, this.quatity = 1, this.outStock = false})
//       : super(key: key);
//   int quatity = 1;
//   bool outStock = false;

//   @override
//   State<CartQtyCounter> createState() => _CartQtyCounterState();
// }

// class _CartQtyCounterState extends State<CartQtyCounter> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           InkWell(
//             child: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Icon(
//                 Icons.remove,
//                 size: 16,
//                 color: widget.quatity > 1
//                     ? AppColors.text
//                     : AppColors.grey.withOpacity(widget.outStock ? 0.25 : 0.5),
//               ),
//             ),
//             onTap: () {
//               if (widget.quatity > 1) {
//                 setState(() {
//                   widget.quatity--;
//                 });
//               }
//             },
//           ),
//           Text(
//             "${widget.quatity}",
//             style: Helper.textStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: widget.outStock
//                   ? AppColors.text.withOpacity(0.5)
//                   : AppColors.text,
//             ),
//           ),
//           InkWell(
//             child: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Icon(
//                 Icons.add,
//                 size: 16,
//                 color: widget.outStock
//                     ? AppColors.text.withOpacity(0.5)
//                     : AppColors.text,
//               ),
//             ),
//             onTap: () {
//               setState(() {
//                 widget.quatity++;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
