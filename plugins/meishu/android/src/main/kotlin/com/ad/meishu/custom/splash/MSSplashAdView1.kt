package com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash

import android.app.Activity
import android.content.Context
import android.view.View
import android.widget.RelativeLayout
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig
import com.cg.driver.exam.ydqnt.plugin.meishu.ResultBeanUtil
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils
import com.meishu.sdk.core.ad.MsAdSlot
import com.meishu.sdk.core.ad.splash.ISplashAd
import com.meishu.sdk.core.ad.splash.SplashAdEventListener
import com.meishu.sdk.core.ad.splash.SplashAdLoader
import com.meishu.sdk.core.loader.InteractionListener
import com.meishu.sdk.core.utils.AdErrorInfo
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class MSSplashAdView1(
    var context: Context,
    var activity: Activity,
    var messenger: BinaryMessenger,
    var id: Int,
    var params: MutableMap<String?, Any?>
) : PlatformView {
    private var adContainer: RelativeLayout? = null
    private val TAG = "MSSplashAdView"
    private var splashAds: ISplashAd<InteractionListener>? = null
    var splashAdLoader: SplashAdLoader? = null
    var channel: MethodChannel? = null

    private var mCodeId: String? = null
    private var supportDeepLink: Boolean? = true
    private var isShake: Boolean? = true
    private var viewWidth: Float
    private var viewHeight: Float
    private var timeout: Int = 3000

    val adEventListener = object : SplashAdEventListener {
        override fun onAdSkip(splashAd: ISplashAd<InteractionListener>?) {
            // 点击跳过按钮回调
            channel?.invokeMethod("onSkip", "开屏广告点击跳过")
            dispose()
        }

        override fun onAdTick(p0: Long) {
            super.onAdTick(p0)
        }

        override fun onAdTimeOver(splashAd: ISplashAd<InteractionListener>?) {
            // 倒计时结束回调
            channel?.invokeMethod("onFinish", "开屏广告倒计时结束")
        }

        /**
         * 广告已经准备完毕，此时可以进行广告的展示操作和相关逻辑处理
         */
        override fun onAdReady(splashAd: ISplashAd<InteractionListener>?) {
            if (splashAd == null) return
            splashAds = splashAd
            splashAds?.showAd(adContainer)
//            adContainer?.removeAllViews()
//            adContainer?.addView(splashAds?.adView)
            channel?.invokeMethod("onReady", "开屏广告准备完毕")
            splashAd.interactionListener = object : InteractionListener {
                override fun onAdClicked() {
                    channel?.invokeMethod("onClick", "开屏广告点击")
                }

                override fun onAdExposure() {
                    channel?.invokeMethod("onShow", "开屏广告显示")
                    channel?.invokeMethod("onEcpm", ResultBeanUtil.toMap(splashAds?.data))
                }

                override fun onAdClosed() {
                    channel?.invokeMethod("onFinish", "开屏广告关闭")
                    dispose()
                }
            }
        }

        override fun onAdError(errorInfo: AdErrorInfo) {
            channel?.invokeMethod("onFail", errorInfo.message.toString())
            dispose()
        }
    }

    init {
        mCodeId = params["androidCodeId"] as String?
        supportDeepLink = params["supportDeepLink"] as Boolean?
        isShake = params["isShake"] as Boolean?
        var width = params["width"] as Double
        var height = params["height"] as Double
        timeout = params["timeout"] as Int
        if (width == 0.0) {
            viewWidth = UIUtils.getScreenWidthDp(context)
        } else {
            viewWidth = width.toFloat()
        }
        if (height == 0.0) {
            viewHeight = UIUtils.px2dip(context, UIUtils.getRealHeight(context).toFloat())
        } else {
            viewHeight = height.toFloat()
        }
        adContainer = RelativeLayout(context)
        channel = MethodChannel(messenger, FlutterMSViewConfig.splashAdView + "_" + id)
        loadSplashAd(mCodeId.toString())
    }


    private fun loadSplashAd(pid: String) {
        val msAdSlot = MsAdSlot.Builder()
            .setPid(pid)
            .setFetchCount(1)
            .setWidth(UIUtils.dip2px(context, viewWidth).toInt())
            .setHeight(UIUtils.dip2px(context, viewHeight).toInt())
            .setIsHideSkipBtn(false)
            .build()

        splashAdLoader = SplashAdLoader(
            context,
            msAdSlot,
            adEventListener,
            5000
        )
        splashAdLoader!!.loadAd()
    }

    private fun showSplashAd(pid: String) {
        val msAdSlot = MsAdSlot.Builder()
            .setPid(pid)
            .setFetchCount(1)
            .setWidth(UIUtils.dip2px(context, viewWidth).toInt())
            .setHeight(UIUtils.dip2px(context, viewHeight).toInt())
            .setIsHideSkipBtn(false)
            .build()
        if (splashAdLoader == null) {
            splashAdLoader = SplashAdLoader(
                context,
                adContainer,
                msAdSlot,
                adEventListener,
                5000
            )
        }
        splashAdLoader?.loadAndShow()
    }

    fun attachTo(viewId: Int, messenger: BinaryMessenger?, params: MutableMap<String?, Any?>?) {
        this.id = viewId
        this.messenger = messenger!!

        if (params != null) {
            mCodeId = params["androidCodeId"] as String?
            supportDeepLink = params["supportDeepLink"] as Boolean?
            isShake = params["isShake"] as Boolean?
            var width = params["width"] as Double
            var height = params["height"] as Double
            timeout = params["timeout"] as Int
            if (width == 0.0) {
                viewWidth = UIUtils.getScreenWidthDp(context)
            } else {
                viewWidth = width.toFloat()
            }
            if (height == 0.0) {
                viewHeight = UIUtils.px2dip(context, UIUtils.getRealHeight(context).toFloat())
            } else {
                viewHeight = height.toFloat()
            }
            adContainer = RelativeLayout(context)
        }
        channel = MethodChannel(messenger, FlutterMSViewConfig.splashAdView + "_" + id)

    }


    override fun getView(): View? {
        return adContainer
    }

    override fun dispose() {
        adContainer?.removeAllViews()
        splashAdLoader?.destroy()
    }
}