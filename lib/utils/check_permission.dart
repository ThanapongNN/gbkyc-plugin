import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../widgets/custom_dialog.dart';

class CheckPermission {
  static camera(BuildContext context) async {
    if (!await Permission.camera.request().isGranted) {
      if (await Permission.camera.isPermanentlyDenied) {
        Get.back();
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: 'Camera_is_disabled'.tr,
            content: 'access_your_camera_Want_to_go_to_settings'.tr,
            avatar: false,
            onPressedConfirm: () {
              Get.back();
              openAppSettings();
            },
            buttonCancel: true,
          ),
        );
        return false;
      }
    }
    return true;
  }

  static photo(BuildContext context) async {
    if (!await Permission.photos.request().isGranted) {
      if (await Permission.photos.isPermanentlyDenied) {
        Get.back();
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            title: 'Photo_is_disabled'.tr,
            content: 'access_your_photo_Want_to_go_to_settings'.tr,
            avatar: false,
            onPressedConfirm: () {
              Get.back();
              openAppSettings();
            },
            buttonCancel: true,
          ),
        );
        return false;
      }
    }
    return true;
  }
}
