import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'meishu_platform_interface.dart';

/// An implementation of [MeishuPlatform] that uses method channels.
class MethodChannelMeishu extends MeishuPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('meishu');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
