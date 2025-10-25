import 'package:flutter_test/flutter_test.dart';
import 'package:meishu/meishu.dart';
import 'package:meishu/meishu_platform_interface.dart';
import 'package:meishu/meishu_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMeishuPlatform
    with MockPlatformInterfaceMixin
    implements MeishuPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MeishuPlatform initialPlatform = MeishuPlatform.instance;

  test('$MethodChannelMeishu is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMeishu>());
  });

  test('getPlatformVersion', () async {
    Meishu meishuPlugin = Meishu();
    MockMeishuPlatform fakePlatform = MockMeishuPlatform();
    MeishuPlatform.instance = fakePlatform;

    expect(await meishuPlugin.getPlatformVersion(), '42');
  });
}
