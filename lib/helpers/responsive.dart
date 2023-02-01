import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design
  static const int largeScreenSize = 1366;
  static const int mediumScreenSize = 768;
  static const int smallScreenSize = 360;
  static const int customScreenSize = 1100;

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < largeScreenSize &&
      MediaQuery.of(context).size.width >= mediumScreenSize;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width >= largeScreenSize) {
          return desktop ?? tablet ?? mobile ?? Container();
        } else if (width >= mediumScreenSize && width < largeScreenSize) {
          return tablet ?? mobile ?? Container();
        } else {
          return mobile ?? tablet ?? desktop ?? Container();
        }
      },
    );
  }
}
