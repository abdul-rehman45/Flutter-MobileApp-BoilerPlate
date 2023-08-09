import 'package:flutterproject/backend/models/auth/user_model.dart';

class AppGlobals {
  static const String appName = "Boiler Plate App";
  static const String appVersion = "1.0.0";
  static const String bundleId = "com.example.boiler_plate"; // app bundle ID

  static const String currency =
      "AED"; // currency if your app need any set it here

  static const String playStoreLink =
      "https://play.google.com/store/apps/details?id=$bundleId";
  static const String appStoreLink = "https://apps.apple.com/us/app/$bundleId";
  static UserModel? user;
}

class AppKeys {
  static const String title = 'title';
  static const String subtitle = 'subtitle';
  static const String value = 'value';
  static const String icon = 'icon';

  static const String recentSearches = 'recentSearches';
}
