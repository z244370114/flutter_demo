
import 'meishu_platform_interface.dart';

class Meishu {
  Future<String?> getPlatformVersion() {
    return MeishuPlatform.instance.getPlatformVersion();
  }
}
