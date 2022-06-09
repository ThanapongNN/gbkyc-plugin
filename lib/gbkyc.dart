import 'package:gbkyc/my_app.dart';
import 'gbkyc_platform_interface.dart';

class Gbkyc {
  Future<String?> getPlatformVersion() {
    return GbkycPlatform.instance.getPlatformVersion();
  }

  show() {
    return main();
  }
}
