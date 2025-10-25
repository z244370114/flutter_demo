package com.ad.meishu

import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSEventPlugin
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.app.Activity
import android.content.Context
import android.util.Log
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.MSInitManager
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.fullscreenvideoadinteraction.FullScreenVideoAdInteraction
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.interstitial.MSInterstitialAdView
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.reward.RewardVideoAdView
import com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash.MSSplashAdPreloadCache
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MeishuPlugin */
class MeishuPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {


  var applicationContext: Context? = null
  var mActivity: Activity? = null
  var mFlutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null
  lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "meishu")
    channel.setMethodCallHandler(this)
    applicationContext = flutterPluginBinding.applicationContext
    mFlutterPluginBinding = flutterPluginBinding
    FlutterMSEventPlugin().onAttachedToEngine(flutterPluginBinding)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "register") {
      var arguments = call.arguments as Map<*, *>
      val appId = arguments["androidAppId"] as String?
      if (appId == null || appId.trim { it <= ' ' }.isEmpty()) {
        Log.e("初始化", "appId can't be null")
        result.success(false)
      } else {
        MSInitManager.instance.initSdk(applicationContext!!, appId, object : MSInitManager.InitCallback {
          override fun onSuccess() {
            Log.e("初始化", "成功")
            mActivity?.runOnUiThread(Runnable {
              result.success(true)
            })
          }

          override fun onError(code: Int, msg: String?) {
            mActivity?.runOnUiThread(Runnable {
              result.success(false)
            })
          }
        })
      }
    } else if (call.method == "loadSplashAd") {
      var arguments = call.arguments as Map<String, *>
      val mCodeId = arguments["androidCodeId"] as String?
      MSSplashAdPreloadCache.preloadAd(mActivity, arguments)
      result.success(true)
    } else if (call.method == "loadFullScreenVideoAdInteraction") {
      val mCodeId = call.argument<String>("androidCodeId")
      val orientation = call.argument<Int>("orientation")
      FullScreenVideoAdInteraction.init(
        mActivity!!,
        mActivity!!,
        mCodeId,
        orientation!!,
      )
      FullScreenVideoAdInteraction.loadFullScreenVideoAd()
      result.success(true)
    } else if (call.method == "showFullScreenVideoAdInteraction") {
      val mCodeId = call.argument<String>("androidCodeId")
      val orientation = call.argument<Int>("orientation")
      FullScreenVideoAdInteraction.init(
        mActivity!!,
        mActivity!!,
        mCodeId,
        orientation!!,
      )
      FullScreenVideoAdInteraction.showAd()
      result.success(true)
    } else if (call.method == "loadRewardVideoAd") {
      val mCodeId = call.argument<String>("androidCodeId")
      RewardVideoAdView.init(mActivity!!, mActivity!!, mCodeId)
      RewardVideoAdView.loadRewardVideoAd()
      result.success(true)
    } else if (call.method == "showRewardVideoAd") {
      val mCodeId = call.argument<String>("androidCodeId")
      RewardVideoAdView.init(mActivity!!, mActivity!!, mCodeId)
      RewardVideoAdView.showAd()
      result.success(true)
    } else if (call.method == "showMSInterstitialAdView") {
      val mCodeId = call.argument<String>("androidCodeId")
      MSInterstitialAdView(
        mActivity!!,
        mActivity!!,
        mCodeId
      )
      result.success(true)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    mActivity = binding.activity
    Log.e("FlutterUnionadPlugin->", "onAttachedToActivity")
    FlutterMSViewPlugin.registerWith(mFlutterPluginBinding!!, mActivity!!)
  }

  override fun onDetachedFromActivityForConfigChanges() {
    mActivity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    mActivity = binding.activity
  }

  override fun onDetachedFromActivity() {
    mActivity = null
  }
}
