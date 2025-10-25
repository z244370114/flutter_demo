package com.cg.driver.exam.ydqnt.plugin.meishu.custom.drawfeedad

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.View
import android.widget.FrameLayout
import com.bytedance.sdk.openadsdk.*
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils
import com.meishu.sdk.core.ad.MsAdSlot
import com.meishu.sdk.core.ad.draw.DrawAd.IDrawVideoListener
import com.meishu.sdk.core.ad.draw.DrawAdEventListener
import com.meishu.sdk.core.ad.draw.DrawAdLoader
import com.meishu.sdk.core.ad.draw.IDrawAd
import com.meishu.sdk.core.ad.recycler.RecylcerAdInteractionListener
import com.meishu.sdk.core.loader.InteractionListener
import com.meishu.sdk.core.utils.AdErrorInfo
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


internal class DrawFeedAdView(
    var context: Context,
    var activity: Activity,
    messenger: BinaryMessenger,
    id: Int,
    params: Map<String?, Any?>
) : PlatformView {
    private val TAG = "DrawFeedAdView"
    private var mDrawFeedAd: TTDrawFeedAd? = null
    private var drawAdLoader: DrawAdLoader? = null
    private var mContainer: FrameLayout? = null

    private var mCodeId: String?
    var supportDeepLink: Boolean? = true
    var viewWidth: Float
    var viewHeight: Float
    var isMuted: Boolean? = true
    private var channel: MethodChannel?

    init {
        mCodeId = params["androidCodeId"] as String?
        supportDeepLink = params["supportDeepLink"] as Boolean?
        var width = params["width"] as Double
        var height = params["height"] as Double
        isMuted = params["isMuted"] as Boolean
        viewWidth = width.toFloat()
        viewHeight = height.toFloat()
        mContainer = FrameLayout(activity)
        channel = MethodChannel(messenger, FlutterMSViewConfig.drawFeedAdView + "_" + id)
        loadDrawFeedAd()
    }

    override fun getView(): View {
        return mContainer!!
    }

    /**
     * 加载广告
     */
    private fun loadDrawFeedAd() {
        val msAdSlot = MsAdSlot.Builder()
            .setPid(mCodeId.toString())
            .setWidth(UIUtils.dip2px(context, viewWidth).toInt())
            .setHeight(UIUtils.dip2px(context, viewHeight).toInt())
            .build()
        drawAdLoader = DrawAdLoader(context, msAdSlot, object : DrawAdEventListener {
            override fun onAdError(errorInfo: AdErrorInfo?) {
                channel?.invokeMethod("onFail", errorInfo?.message)
            }

            override fun onAdReady(iDrawAd: IDrawAd) {
                iDrawAd.showAd(mContainer)
                val clickableViews: MutableList<View?> = ArrayList<View?>()
                clickableViews.add(mContainer)
                iDrawAd.bindAdToView(
                    mContainer,
                    mContainer,
                    clickableViews,
                    object : RecylcerAdInteractionListener {
                        override fun onAdClicked() {
                        }

                        override fun onAdClosed() {
                        }

                        override fun onAdRenderFailed() {
                        }

                        override fun onAdExposure() {
                        }
                    })
                iDrawAd.setOnDrawVideoListener(object : IDrawVideoListener {
                    override fun playRenderingStart() {
                        Log.e(TAG, "playRenderingStart: ")
                    }

                    override fun playPause() {
                        Log.e(TAG, "playPause: ")
                    }

                    override fun playResume() {
                        Log.e(TAG, "playResume: ")
                    }

                    override fun playCompletion() {
                        Log.e(TAG, "playCompletion: ")
                    }

                    override fun playError() {
                        Log.e(TAG, "playError: ")
                        channel?.invokeMethod("onFail", "视频播放错误")
                    }

                    override fun pauseBtnClick() {
                        Log.e(TAG, "pauseBtnClick: ")
                    }

                    override fun onProgressUpdate(current: Long, duration: Long) {
                        Log.e(TAG, "onProgressUpdate: " + current)
                    }

                    override fun onClickRetry() {
                        Log.e(TAG, "onClickRetry: ")
                    }

                    override fun onVideoLoad() {
                        Log.e(TAG, "onVideoLoad: ")
                    }

                    override fun onVideoError(errorCode: Int, extraCode: Int) {
                        Log.e(TAG, "onVideoError: " + errorCode)
                    }
                })
            }
        })
        drawAdLoader?.loadAd()
    }

    override fun dispose() {
        Log.e(TAG, "广告释放")
        mContainer?.removeAllViews()
        mDrawFeedAd?.destroy()
    }
}