import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../state_store.dart';

Future<void> initDeviceSerial() async {
  try {
    if (Platform.isAndroid) {
      var data = await DeviceInfoPlugin().androidInfo;
      StateStore.deviceSerial.value = data.androidId!;
      debugPrint('IMEI : ${StateStore.deviceSerial}');
    } else if (Platform.isIOS) {
      var data = await DeviceInfoPlugin().iosInfo;
      StateStore.deviceSerial.value = data.identifierForVendor!;
      debugPrint('IMEI : ${StateStore.deviceSerial}');
    }
  } on PlatformException {
    StateStore.deviceSerial.value = '';
  }
}
