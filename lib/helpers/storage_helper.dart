import 'package:flutterproject/constants/globals.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage storageBox = GetStorage();

class StorageHelper {
  static Future<void> saveVariable(String? key, dynamic value) async {
    if (key != null && value != null) {
      await storageBox.write(key, value);
    }
  }

  static Future<dynamic> getVariable(String? key) async {
    if (key != null) {
      return storageBox.read(key);
    }
    return null;
  }

  static Future<void> clearStorage() async {
    AppGlobals.user = null;
    await storageBox.erase();
  }
}
