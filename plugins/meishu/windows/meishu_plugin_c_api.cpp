#include "include/meishu/meishu_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "meishu_plugin.h"

void MeishuPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  meishu::MeishuPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
