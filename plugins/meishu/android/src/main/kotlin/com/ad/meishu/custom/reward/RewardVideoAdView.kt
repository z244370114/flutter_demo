package com.cg.driver.exam.ydqnt.plugin.meishu.custom.reward

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSEventPlugin
import com.cg.driver.exam.ydqnt.plugin.meishu.ResultBeanUtil
import com.meishu.sdk.core.ad.MsAdSlot
import com.meishu.sdk.core.ad.reward.RewardAdEventListener
import com.meishu.sdk.core.ad.reward.RewardAdMediaListener
import com.meishu.sdk.core.ad.reward.RewardVideoAd
import com.meishu.sdk.core.ad.reward.RewardVideoLoader
import com.meishu.sdk.core.loader.InteractionListener
import com.meishu.sdk.core.utils.AdErrorInfo

@SuppressLint("StaticFieldLeak")
object RewardVideoAdView {

    private var TAG = "RewardVideoAdView"
    var mContext: Context? = null
    var mActivity: Activity? = null

    private var mCodeId: String? = null
    private var rewardVideoLoader: RewardVideoLoader? = null
    private var rewardVideoAd: RewardVideoAd? = null
    private var msAdSlot: MsAdSlot? = null
    private var isShowAd = false


    var adEventListener: RewardAdEventListener = object : RewardAdEventListener {
        override fun onVideoCached(ad: RewardVideoAd?) {
            var map: MutableMap<String, Any?> = mutableMapOf(
                "adType" to "rewardAd",
                "onAdMethod" to "onCache",
            )
            FlutterMSEventPlugin.sendContent(map)
        }

        override fun onReward(map: MutableMap<String?, Any?>?) {
            var map: MutableMap<String, Any?> = mutableMapOf(
                "adType" to "rewardAd",
                "onAdMethod" to "onFinish",
            )
            FlutterMSEventPlugin.sendContent(map)
        }

        override fun onAdError(adErrorInfo: AdErrorInfo?) {
            var map: MutableMap<String, Any?> = mutableMapOf(
                "adType" to "rewardAd",
                "onAdMethod" to "onFail",
                "error" to "${adErrorInfo?.code} ${adErrorInfo?.message}"
            )
            FlutterMSEventPlugin.sendContent(map)
            destroy()
        }

        override fun onAdReady(ad: RewardVideoAd) {
            if (rewardVideoAd == null) {
                rewardVideoAd = ad
                if(isShowAd){
                    rewardVideoAd?.showAd(mActivity)
                }
            }
            FlutterMSEventPlugin.sendContent(
                mutableMapOf(
                    "adType" to "rewardAd",
                    "onAdMethod" to "onReady",
                )
            )
            ad.interactionListener = object : InteractionListener {
                override fun onAdClicked() {
                    FlutterMSEventPlugin.sendContent(
                        mutableMapOf(
                            "adType" to "rewardAd",
                            "onAdMethod" to "onClick",
                        )
                    )
                }

                override fun onAdExposure() {
                    FlutterMSEventPlugin.sendContent(
                        mutableMapOf(
                            "adType" to "rewardAd",
                            "onAdMethod" to "onEcpm",
                            "info" to ResultBeanUtil.toMap(ad.data)
                        )
                    )
                }

                override fun onAdClosed() {
                    destroy()
                    var map: MutableMap<String, Any?> = mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onClose",
                    )
                    FlutterMSEventPlugin.sendContent(map)
                }
            }
            ad.setMediaListener(object : RewardAdMediaListener {
                override fun onVideoStart() {
                    var map: MutableMap<String, Any?> = mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onStart",
                    )
                    FlutterMSEventPlugin.sendContent(map)
                }

                override fun onVideoPause() {
                }

                override fun onVideoResume() {
                }

                override fun onVideoCompleted() {

                }

                override fun onVideoError() {
                    var map: MutableMap<String, Any?> = mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onFail",
                    )
                    FlutterMSEventPlugin.sendContent(map)
                    destroy()
                }

                override fun onSkippedVideo() {
                    var map: MutableMap<String, Any?> = mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onSkip",
                    )
                    FlutterMSEventPlugin.sendContent(map)
                    destroy()
                }
            })
        }
    }

    fun init(
        context: Context,
        mActivity: Activity,
        mCodeId: String?,
    ) {
        this.mContext = context
        this.mActivity = mActivity
        this.mCodeId = mCodeId
    }

    fun loadRewardVideoAd() {
        msAdSlot = MsAdSlot.Builder()
            .setPid(mCodeId.toString())
            .build()
        rewardVideoLoader = RewardVideoLoader(mActivity!!, msAdSlot, adEventListener)
        rewardVideoLoader?.loadAd()
    }

    fun showAd() {
        isShowAd = true
        if (msAdSlot == null) {
            msAdSlot = MsAdSlot.Builder()
                .setPid(mCodeId.toString())
                .build()
        }
        if (rewardVideoLoader == null) {
            rewardVideoLoader = RewardVideoLoader(mActivity!!, msAdSlot, adEventListener)
            rewardVideoLoader?.loadAd()
        } else {
            rewardVideoAd?.showAd(mActivity)
        }
        FlutterMSEventPlugin.sendContent(
            mutableMapOf(
                "adType" to "rewardAd",
                "onAdMethod" to "onShow",
            )
        )
    }

    fun destroy() {
        rewardVideoLoader?.destroy()
        rewardVideoAd?.destroy()
        isShowAd = false
        rewardVideoLoader = null
        rewardVideoAd = null
        mContext = null
        mActivity = null
    }
}