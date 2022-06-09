import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gbkyc_platform_interface.dart';

/// An implementation of [GbkycPlatform] that uses method channels.
class MethodChannelGbkyc extends GbkycPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gbkyc');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
