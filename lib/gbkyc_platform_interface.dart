import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gbkyc_method_channel.dart';

abstract class GbkycPlatform extends PlatformInterface {
  /// Constructs a GbkycPlatform.
  GbkycPlatform() : super(token: _token);

  static final Object _token = Object();

  static GbkycPlatform _instance = MethodChannelGbkyc();

  /// The default instance of [GbkycPlatform] to use.
  ///
  /// Defaults to [MethodChannelGbkyc].
  static GbkycPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GbkycPlatform] when
  /// they register themselves.
  static set instance(GbkycPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
