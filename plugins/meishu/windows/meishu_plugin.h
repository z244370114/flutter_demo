#ifndef FLUTTER_PLUGIN_MEISHU_PLUGIN_H_
#define FLUTTER_PLUGIN_MEISHU_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace meishu {

class MeishuPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MeishuPlugin();

  virtual ~MeishuPlugin();

  // Disallow copy and assign.
  MeishuPlugin(const MeishuPlugin&) = delete;
  MeishuPlugin& operator=(const MeishuPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace meishu

#endif  // FLUTTER_PLUGIN_MEISHU_PLUGIN_H_
