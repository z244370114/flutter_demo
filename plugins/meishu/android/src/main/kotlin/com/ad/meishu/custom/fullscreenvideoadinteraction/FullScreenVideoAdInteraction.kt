package com.cg.driver.exam.ydqnt.plugin.meishu.custom.fullscreenvideoadinteraction

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.util.Log
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSEventPlugin
import com.cg.driver.exam.ydqnt.plugin.meishu.ResultBeanUtil
import com.meishu.sdk.core.ad.MsAdSlot
import com.meishu.sdk.core.ad.fullscreenvideo.FullScreenAdEventListener
import com.meishu.sdk.core.ad.fullscreenvideo.FullScreenVideoAdLoader
import com.meishu.sdk.core.ad.fullscreenvideo.IFullScreenVideoAd
import com.meishu.sdk.core.loader.InteractionListener
import com.meishu.sdk.core.utils.AdErrorInfo
import com.meishu.sdk.core.utils.LogUtil


@SuppressLint("StaticFieldLeak")
object FullScreenVideoAdInteraction {
    private var TAG = "FullScreenVideoExpressAd"
    var mContext: Context? = null
    var mActivity: Activity? = null

    //广告所需参数
    private var mCodeId: String? = null
    private var orientation: Int = 1

    private var fullScreenVideoAdLoader: FullScreenVideoAdLoader? = null
    private var fullScreenVideoAds: IFullScreenVideoAd? = null
    private var msAdSlot: MsAdSlot? = null
    private var isShowAd = false

    val listener = object : FullScreenAdEventListener {
        override fun onAdError(errorInfo: AdErrorInfo?) {
            var map: MutableMap<String, Any?> = mutableMapOf(
                "adType" to "fullScreenVideoAdInteraction",
                "onAdMethod" to "onFail",
                "error" to "${errorInfo?.code} , ${errorInfo?.message}"
            )
            FlutterMSEventPlugin.sendContent(map)
            destroy()
        }

        /**
         * 广告已经准备完毕，此时可以进行广告的展示操作和相关逻辑处理
         */
        override fun onAdReady(fullScreenVideoAd: IFullScreenVideoAd?) {
            var map: MutableMap<String, Any?> = mutableMapOf(
                "adType" to "fullScreenVideoAdInteraction", "onAdMethod" to "onReady"
            )
            FlutterMSEventPlugin.sendContent(map)
            if (fullScreenVideoAds == null) {
                fullScreenVideoAds = fullScreenVideoAd
                if (isShowAd) {
                    fullScreenVideoAds?.showAd(mActivity)
                }
            }
            fullScreenVideoAd?.interactionListener = object : InteractionListener {
                override fun onAdClicked() {
                    var map: MutableMap<String, Any?> = mutableMapOf(
                        "adType" to "fullScreenVideoAdInteraction", "onAdMethod" to "onClick"
                    )
                    FlutterMSEventPlugin.sendContent(map)
                }

                override fun onAdExposure() {
                    FlutterMSEventPlugin.sendContent(
                        mutableMapOf(
                            "adType" to "fullScreenVideoAdInteraction",
                            "onAdMethod" to "onEcpm",
                            "info" to ResultBeanUtil.toMap(fullScreenVideoAds?.data)
                        )
                    )
                }

                override fun onAdClosed() {
                    var map: MutableMap<String, Any?> = mutableMapOf(
                        "adType" to "fullScreenVideoAdInteraction", "onAdMethod" to "onClose"
                    )
                    FlutterMSEventPlugin.sendContent(map)
                    destroy()
                }
            }
        }
    }

    fun init(
        context: Context,
        mActivity: Activity,
        mCodeId: String?,
        orientation: Int?,
    ) {
        this.mContext = context
        this.mActivity = mActivity
        this.mCodeId = mCodeId
        this.orientation = orientation!!
    }

    fun loadFullScreenVideoAd() {
        Log.e(TAG, "广告位id  $mCodeId")
        msAdSlot = MsAdSlot.Builder()
            .setPid(mCodeId.toString())
            .build()
        fullScreenVideoAdLoader = FullScreenVideoAdLoader(mActivity!!, msAdSlot, listener)
        fullScreenVideoAdLoader!!.loadAd()
    }

    fun showAd() {
        isShowAd = true
        if (msAdSlot == null) {
            msAdSlot = MsAdSlot.Builder()
                .setPid(mCodeId.toString())
                .build()
        }
        if (fullScreenVideoAdLoader == null) {
            fullScreenVideoAdLoader = FullScreenVideoAdLoader(mActivity!!, msAdSlot, listener)
            fullScreenVideoAdLoader!!.loadAd()
        } else {
            fullScreenVideoAds?.showAd(mActivity)
        }

        FlutterMSEventPlugin.sendContent(
            mutableMapOf(
                "adType" to "fullScreenVideoAdInteraction",
                "onAdMethod" to "onShow",
            )
        )
    }

    fun destroy() {
        fullScreenVideoAdLoader?.destroy()
        fullScreenVideoAds = null
        isShowAd = false
    }
}