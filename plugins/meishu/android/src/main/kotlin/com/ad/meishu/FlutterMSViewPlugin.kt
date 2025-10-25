package com.cg.driver.exam.ydqnt.plugin.meishu

import android.app.Activity
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.banner.MSBannerAdViewFactory
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.drawfeedad.DrawFeedAdViewFactory
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.nativead.NativeAdViewFactory
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash.MSSplashAdViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin

object FlutterMSViewPlugin {
    fun registerWith(binding: FlutterPlugin.FlutterPluginBinding, activity: Activity) {
        //注册开屏广告
        binding.platformViewRegistry.registerViewFactory(
            FlutterMSViewConfig.splashAdView,
            MSSplashAdViewFactory(binding.binaryMessenger, activity)
        )
        //注册banner广告
        binding.platformViewRegistry.registerViewFactory(
            FlutterMSViewConfig.bannerAdView,
            MSBannerAdViewFactory(binding.binaryMessenger, activity)
        )
        //注册个性化模板信息流广告
        binding.platformViewRegistry.registerViewFactory(
            FlutterMSViewConfig.nativeAdView,
            NativeAdViewFactory(binding.binaryMessenger, activity)
        )
        binding.platformViewRegistry.registerViewFactory(
            FlutterMSViewConfig.videoAdView,
            NativeAdViewFactory(binding.binaryMessenger, activity)
        )
        //注册个性化模板draw视频广告
        binding.platformViewRegistry.registerViewFactory(
            FlutterMSViewConfig.drawFeedAdView,
            DrawFeedAdViewFactory(binding.binaryMessenger, activity)
        )
    }
}