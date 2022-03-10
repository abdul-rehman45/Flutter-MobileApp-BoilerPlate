// import 'package:buddytobody/Constants/app_colors.dart';
// import 'package:buddytobody/Constants/assets.dart';
// import 'package:buddytobody/Constants/globals.dart';
// import 'package:buddytobody/Apis/GetxControllers/activityController/activity_service.dart';
// import 'package:buddytobody/Services/nav_bar_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BottomNavBar extends StatefulWidget {
//   BottomNavBar(
//       {Key? key,
//       this.notifyChat = true,
//       this.notifyCart = true,
//       this.selectedDog,
//       this.selectedIndex = 0,
//       required this.onTap})
//       : super(key: key);
//   final bool notifyChat, notifyCart;
//   final String? selectedDog;
//   int selectedIndex;
//   final Function(int index) onTap;

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   //int _selectedIndex = 0;
//   double dogPosition = 0;
//   bool _isDragged = false;

//   final NavBarService _navBarService = Get.find();

//   @override
//   void initState() {
//     //_selectedIndex = widget.selectedIndex??_selectedIndex;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<NavBarService>(
//       init: NavBarService(),
//       builder: (context) => Stack(
//         overflow: Overflow.visible,
//         children: [
//           Container(height: 100, color: Colors.transparent),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: 70,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.topRight,
//                   colors: [
//                     AppColors.g5Color,
//                     AppColors.g3Color,
//                   ],
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _navItem(AppIcons.buddyLogo, 0),
//                   // _navItem(AppIcons.bag, 1),
//                   _navItem(AppIcons.paws, 2),
//                   _navItem(AppIcons.chat, 3),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               _dragTarget(0),
//               // _dragTarget(1),
//               _dragTarget(2),
//               _dragTarget(3),
//             ],
//           ),
//           AnimatedPositioned(
//             bottom: _navBarService.dogList[0].position,
//             left: _dogPosition(),
//             duration: Duration(milliseconds: _isDragged ? 0 : 500),
//             child: InkWell(
//               onTap: () {
//                 _navBarService.showDogOverlay.value =
//                     !_navBarService.showDogOverlay.value;
//               },
//               child: Draggable<int>(
//                 data: _navBarService.selectedDog.value,
//                 axis: Axis.horizontal,
//                 feedback: Image.asset(
//                   _navBarService.dogList[0].navDog,
//                   height: _navBarService.dogList[0].height,
//                   width: 70,
//                   fit: BoxFit.contain,
//                 ),
//                 childWhenDragging: Container(),
//                 child: Image.asset(
//                   _navBarService.dogList[0].navDog,
//                   height: _navBarService.dogList[0].height,
//                   width: 60,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _navItem(String iconPath, int index) => Stack(
//         children: [
//           InkWell(
//             onTap: () {
//               if (widget.selectedIndex != index) {
//                 _isDragged = false;
//                 widget.selectedIndex = index;
//                 setState(() {});
//                 widget.onTap(widget.selectedIndex);
//               }
//             },
//             // () => widget.onTap!(index),

//             child: Container(
//               width: AppGlobals.screenWidth / 3,
//               child: Image.asset(
//                 iconPath,
//                 height: 36,
//                 color: widget.selectedIndex == index
//                     ? AppColors.lightGreen
//                     : Colors.white,
//               ),
//             ),
//           ),
//           if (index == 3 && widget.notifyChat) showDot(),
//         ],
//       );

//   Widget showDot() => Positioned(
//         top: 4,
//         left: 0,
//         right: 24,
//         child: Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.red,
//           ),
//         ),
//       );

//   Widget _dragTarget(int index) => DragTarget<int>(
//         builder: (
//           BuildContext context,
//           List<dynamic> accepted,
//           List<dynamic> rejected,
//         ) {
//           return Container(
//             height: 50.0,
//             width: AppGlobals.screenWidth / 3,
//           );
//         },
//         onAccept: (_) {
//           setState(() {
//             widget.selectedIndex = index;
//             widget.onTap(widget.selectedIndex);
//             _isDragged = true;
//           });
//         },
//       );

//   double _dogPosition() {
//     switch (widget.selectedIndex) {
//       case 0:
//         return _navBarService.dogPosition.value = AppGlobals.screenWidth / 10;
//       case 1:
//         return _navBarService.dogPosition.value = AppGlobals.screenWidth / 3.5;
//       case 2:
//         return _navBarService.dogPosition.value = AppGlobals.screenWidth / 2.3;
//       case 3:
//         return _navBarService.dogPosition.value = AppGlobals.screenWidth / 1.3;
//       default:
//         return 0;
//     }
//   }
// }
