import 'package:flutter/cupertino.dart';
import 'package:flutterproject/widgets/dialogs/custom_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHndler {
  static Future<bool> permission({required Permission permission}) async {
    PermissionStatus permissionStatus = await permission.status;
    print("permission ${permissionStatus}");
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    }

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await permission.request();

      if (permissionStatus == PermissionStatus.granted) {
        return true;
      }
      if (permissionStatus == PermissionStatus.permanentlyDenied) {
        //if (Platform.isAndroid) {
        await showOpenAppSettingsDialog(
            description: permission.toString().split('.').last.toString());
        await Future.delayed(Duration(seconds: 5));
        permissionStatus = await permission.status;
        print("after setting open $permissionStatus");
        if (permissionStatus == PermissionStatus.granted) {
          return true;
        }
        // }
        return false;
      }
      return false;
    }

    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      await showOpenAppSettingsDialog(
          description: permission.toString().split('.').last.toString());
      //if(Platform.isAndroid)
      await Future.delayed(Duration(seconds: 5));
      // permissionStatus = await permissioncheck.status;
      print("after setting open $permissionStatus");
      if (permissionStatus == PermissionStatus.granted) {
        return true;
      }
      return false;
    }
    if (permissionStatus == PermissionStatus.limited ||
        permissionStatus == PermissionStatus.restricted) {
      showOpenAppSettingsDialog(
          description: permission.toString().split('.').last.toString());
      await Future.delayed(Duration(seconds: 5));
      //  permissionStatus = await permissioncheck.status;
      if (permissionStatus == PermissionStatus.granted) {
        return true;
      }
      return false;
    }

    // LocationPermission permission;

    // permissionStatus = await permission.status;
    // print("permission ${permissionStatus}");
    // if (permissionStatus == PermissionStatus.granted) {
    //   return true;
    // }
    // // permission = await Geolocator.checkPermission();
    // if (permissionStatus == PermissionStatus.denied) {
    //   //permission = await Geolocator.requestPermission();

    //   //permissionStatus = await permissioncheck.request();
    //   //permissionStatus = await permissioncheck.status;

    //   if (permissionStatus == PermissionStatus.granted) {
    //     return true;
    //   }
    // }

    // if (permissionStatus == PermissionStatus.permanentlyDenied) {
    //   //await _showOpenAppSettingsDialog();
    //   await Future.delayed(Duration(seconds: 5));
    //   // permissionStatus = await permissioncheck.status;
    //   print("after setting open $permissionStatus");
    //   if (permissionStatus == PermissionStatus.granted) {
    //     return true;
    //   }
    // }
    // if (permissionStatus == PermissionStatus.limited ||
    //     permissionStatus == PermissionStatus.restricted) {
    //   // _showOpenAppSettingsDialog();
    //   await Future.delayed(Duration(seconds: 5));
    //   //  permissionStatus = await permissioncheck.status;
    //   if (permissionStatus == PermissionStatus.granted) {
    //     return true;
    //   }
    // }

    return false;
  }

  static Future<void> showOpenAppSettingsDialog({String? description}) async {
    await Get.dialog(
      CustomDialog(
        title: 'Permission needed',
        description:
            "Allow ESR to access this device's  ${description ?? ""} ?",
        button1: 'Cancel',
        button2: 'Open Setting',
        descrpitionTextAlign: TextAlign.start,
        tap2: () async {
          await openAppSettings();

          Get.back();
        },
        tap1: () {
          Get.back();
          //return false;
        },
      ),
    );
  }
}
