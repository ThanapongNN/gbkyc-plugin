import 'package:flutter/material.dart';
import 'package:gbkyc/my_app.dart';
import 'gbkyc_platform_interface.dart';

class Gbkyc {
  Future<String?> getPlatformVersion() {
    return GbkycPlatform.instance.getPlatformVersion();
  }

  Widget show() {
    return const MyApp();
  }
}
