import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'meishu_method_channel.dart';

abstract class MeishuPlatform extends PlatformInterface {
  /// Constructs a MeishuPlatform.
  MeishuPlatform() : super(token: _token);

  static final Object _token = Object();

  static MeishuPlatform _instance = MethodChannelMeishu();

  /// The default instance of [MeishuPlatform] to use.
  ///
  /// Defaults to [MethodChannelMeishu].
  static MeishuPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MeishuPlatform] when
  /// they register themselves.
  static set instance(MeishuPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
