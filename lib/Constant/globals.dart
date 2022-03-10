import 'dart:io' show Platform;

class AppGlobals {
  static double screenHeight = 600;
  static double screenWidth = 300;
  static bool isFirstView = true;

// user detail
  static int? userId;
  static String? email;
  static String? firstName;
  static String? lastName;
  static String? gender;
  static String? dob;
  static int? age;
  //static String? image = AppImages.defaultUser;

  static String? countryCode = '+1';
  static String? cellNumber;
  static bool isDarkMode = false;
  static double userStepsGoal = 8000;
  static String goalDate = DateTime.now().toString().substring(0, 10);

  static int androidVersion = 0;
  static String? getFullName() {
    return '$firstName $lastName';
  }

  static String getUsersFullName(String? fName, String? lName) {
    return '$fName $lName';
  }

  static String getDogGenderAndBread(String? gender, String? bread) {
    return '$gender, $bread';
  }

  static String userImage(List<String>? image) {
    return image != null && image.isNotEmpty
        ? image[0]
        : "https://images.unsplash.com/photo-1606229155208-1a5e7bfead60?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=723&q=80";
  }

  /// URL luncher ///

  // void urlLuncher({String? url}) async {
  //   if (await canLaunch(url!)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  // static Future<Position?> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   // // if (!serviceEnabled) {
  //   // //   // Location services are not enabled don't continue
  //   // //   // accessing the position and request users of the
  //   // //   // App to enable the location services.
  //   // //   return Future.error('Location services are disabled.');
  //   // // }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }

  // static Future<String?> getLandMark(lat, long) async {
  //   var address = [];
  //   address = await placemarkFromCoordinates(lat, long);

  //   if (address.isNotEmpty) {
  //     String place = Platform.isIOS
  //         ? ("${address[0].locality}" +
  //             ", " +
  //             "${address[0].administrativeArea}")
  //         : ("${address[0].subAdministrativeArea}" +
  //             ", " +
  //             "${address[0].administrativeArea}");
  //     return place;
  //   }
  //   return null;
  // }

}
