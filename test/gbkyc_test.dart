import 'package:flutter_test/flutter_test.dart';
import 'package:gbkyc/gbkyc.dart';
import 'package:gbkyc/gbkyc_platform_interface.dart';
import 'package:gbkyc/gbkyc_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGbkycPlatform 
    with MockPlatformInterfaceMixin
    implements GbkycPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GbkycPlatform initialPlatform = GbkycPlatform.instance;

  test('$MethodChannelGbkyc is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGbkyc>());
  });

  test('getPlatformVersion', () async {
    Gbkyc gbkycPlugin = Gbkyc();
    MockGbkycPlatform fakePlatform = MockGbkycPlatform();
    GbkycPlatform.instance = fakePlatform;
  
    expect(await gbkycPlugin.getPlatformVersion(), '42');
  });
}
