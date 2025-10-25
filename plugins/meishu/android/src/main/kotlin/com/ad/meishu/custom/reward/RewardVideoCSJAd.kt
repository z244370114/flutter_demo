
package com.cg.driver.exam.ydqnt.plugin.meishu.custom.reward
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.os.Bundle
import android.util.Log
import com.bytedance.sdk.openadsdk.AdSlot
import com.bytedance.sdk.openadsdk.TTAdConstant
import com.bytedance.sdk.openadsdk.TTAdNative.RewardVideoAdListener
import com.bytedance.sdk.openadsdk.TTAdSdk
import com.bytedance.sdk.openadsdk.TTRewardVideoAd
import com.bytedance.sdk.openadsdk.TTRewardVideoAd.RewardAdInteractionListener
import com.bytedance.sdk.openadsdk.mediation.MediationConstant
import com.bytedance.sdk.openadsdk.mediation.ad.MediationAdSlot
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSEventPlugin
import com.cg.driver.exam.ydqnt.plugin.meishu.ResultBeanUtil


@SuppressLint("StaticFieldLeak")
object RewardVideoCSJDAd {
    private val TAG = "RewardVideoAd"

    var mContext: Context? = null
    var mActivity: Activity? = null

    private var mttRewardVideoAd: TTRewardVideoAd? = null
    private var mIsLoaded = false //视频是否加载完成

    //参数
    private var mCodeId: String? = null
    private var rewardName: String? = null
    private var rewardAmount: Int? = 0
    private var userID: String? = null
    private var orientation: Int? = TTAdConstant.VERTICAL
    private var mediaExtra: String? = null
    private var mutedIfCan: Boolean = true

    fun init(context: Context, mActivity: Activity, params: Map<String?, Any?>) {
        this.mContext = context
        this.mActivity = mActivity
        this.mCodeId = params["androidCodeId"] as String
        this.rewardName = params["rewardName"] as String
        this.rewardAmount = params["rewardAmount"] as Int
        this.userID = params["userID"] as String
        this.mutedIfCan = params["mutedIfCan"] as Boolean
        if (params["orientation"] == null) {
            orientation = 0
        } else {
            this.orientation = params["orientation"] as Int
        }
        if (params["mediaExtra"] == null) {
            this.mediaExtra = ""
        } else {
            this.mediaExtra = params["mediaExtra"] as String
        }
        loadRewardVideoAd()
    }

    private fun loadRewardVideoAd() {
        val adSlot = AdSlot.Builder()
            .setCodeId(mCodeId) //广告位id
            .setUserID(userID)
            .setOrientation(orientation!!)//横竖屏设置
            .setMediationAdSlot(
                MediationAdSlot.Builder()
                    .setRewardName(rewardName) //奖励的名称
                    .setRewardAmount(rewardAmount!!) //奖励的数量
                    .setExtraObject(MediationConstant.ADN_PANGLE, mediaExtra)//服务端奖励验证透传参数
                    .setExtraObject(MediationConstant.KEY_GROMORE_EXTRA, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_GDT, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_BAIDU, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_KS, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_KLEVIN, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_ADMOB, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_SIGMOB, mediaExtra)
                    .setExtraObject(MediationConstant.ADN_UNITY, mediaExtra)
                    .setMuted(mutedIfCan)
                    .build()
            )
            .setMediaExtra(mediaExtra) //用户透传的信息，可不传
            .build()
        val mTTAdNative = TTAdSdk.getAdManager().createAdNative(mActivity)
        mTTAdNative.loadRewardVideoAd(adSlot, object : RewardVideoAdListener {
            override fun onError(code: Int, message: String) {
                Log.e(TAG, "视频加载失败$code $message")
                var map: MutableMap<String, Any?> = mutableMapOf(
                    "adType" to "rewardAd",
                    "onAdMethod" to "onFail",
                    "error" to "$code $message"
                )
                FlutterMSEventPlugin.sendContent(map)
            }

            //视频广告加载后的视频文件资源缓存到本地的回调
            override fun onRewardVideoCached() {
                Log.e(TAG, "rewardVideoAd video cached")
            }

            override fun onRewardVideoCached(p0: TTRewardVideoAd?) {
                Log.e(TAG, "rewardVideoAd video cached2")
                var map: MutableMap<String, Any?> =
                    mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onCache")
                FlutterMSEventPlugin.sendContent(map)
            }

            //视频广告素材加载到，如title,视频url等，不包括视频文件
            override fun onRewardVideoAdLoad(ad: TTRewardVideoAd) {
                Log.e(TAG, "rewardVideoAd loaded 广告类型：${getAdType(ad.rewardVideoAdType)}")
                mIsLoaded = false
                mttRewardVideoAd = ad
                FlutterMSEventPlugin.sendContent(
                    mutableMapOf(
                        "adType" to "rewardAd",
                        "onAdMethod" to "onReady"
                    )
                )
            }
        })
    }

    private fun bindAdListener() {
        mttRewardVideoAd?.setRewardAdInteractionListener(object :
            RewardAdInteractionListener {
            override fun onAdShow() {
                Log.e(TAG, "rewardVideoAd show")
                FlutterMSEventPlugin.sendContent(
                    mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onShow")
                )
//                Log.d(TAG,"ecpm ${ResultBeanUtil.toMap(mttRewardVideoAd?.mediationManager?.showEcpm)}")
//                FlutterMSEventPlugin.sendContent(
//                    mutableMapOf(
//                        "adType" to "rewardAd",
//                        "onAdMethod" to "onEcpm",
//                        "info" to ResultBeanUtil.toMap(mttRewardVideoAd?.mediationManager?.showEcpm)
//                    )
//                )
            }

            override fun onAdVideoBarClick() {
                Log.e(TAG, "rewardVideoAd bar click")
                var map: MutableMap<String, Any?> =
                    mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onClick")
                FlutterMSEventPlugin.sendContent(map)
            }

            override fun onAdClose() {
                Log.e(TAG, "rewardVideoAd close")
                var map: MutableMap<String, Any?> =
                    mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onClose")
                FlutterMSEventPlugin.sendContent(map)
            }

            override fun onVideoError() {
                Log.e(TAG, "rewardVideoAd onVideoError")
//                var map: MutableMap<String, Any?> = mutableMapOf(
//                    "adType" to "rewardAd",
//                    "onAdMethod" to "onFail",
//                    "error" to ""
//                )
//                FlutterMSEventPlugin.sendContent(map)
            }

            override fun onVideoComplete() {
                Log.e(TAG, "rewardVideoAd complete")
            }

            /**
             * 视频播放完成后，奖励验证回调
             * rewardVerify：是否有效，
             * rewardAmount：奖励梳理，
             * rewardName：奖励名称，
             * code：错误码，
             * msg：错误信息
             */
            override fun onRewardVerify(
                p0: Boolean,
                p1: Int,
                p2: String?,
                p3: Int,
                p4: String?
            ) {
                Log.e(TAG, "verify: $p0 amount:$p1 name:$p2 p3:$p3 p4:$p4")
                var map: MutableMap<String, Any?> = mutableMapOf(
                    "adType" to "rewardAd",
                    "onAdMethod" to "onVerify",
                    "rewardVerify" to p0,
                    "rewardAmount" to p1,
                    "rewardName" to p2,
                    "errorCode" to p3,
                    "error" to p4
                )
                FlutterMSEventPlugin.sendContent(map)
            }

            /**
             * 激励视频播放完毕，验证是否有效发放奖励的回调 4400版本新增
             *
             * @param isRewardValid 奖励有效
             * @param rewardType 奖励类型，0:基础奖励 >0:进阶奖励
             * @param extraInfo 奖励的额外参数
             */
            override fun onRewardArrived(
                isRewardValid: Boolean,
                rewardType: Int,
                extraInfo: Bundle
            ) {
                // 当用户的观看行为满足了奖励条件
                Log.e(
                    TAG, "onRewardArrived " +
                            "\n奖励是否有效：" + isRewardValid +
                            "\n奖励类型：" + rewardType
                );
                var map: MutableMap<String, Any?> = mutableMapOf(
                    "adType" to "rewardAd",
                    "onAdMethod" to "onRewardArrived",
                    "rewardVerify" to isRewardValid,
                    "rewardType" to rewardType,
                    "rewardAmount" to (extraInfo["reward_extra_key_reward_amount"] as? Integer
                        ?: (extraInfo["reward_extra_key_reward_amount"] as Float).toInt()),
                    "rewardName" to extraInfo["reward_extra_key_reward_name"],
                    "propose" to extraInfo["reward_extra_key_reward_propose"],
                    "errorCode" to extraInfo["reward_extra_key_error_code"],
                    "error" to extraInfo["reward_extra_key_error_msg"]
                )
                FlutterMSEventPlugin.sendContent(map)
            }

            override fun onSkippedVideo() {
                Log.e(TAG, "rewardVideoAd onSkippedVideo")
                var map: MutableMap<String, Any?> =
                    mutableMapOf("adType" to "rewardAd", "onAdMethod" to "onSkip")
                FlutterMSEventPlugin.sendContent(map)
            }
        })
    }

    /**
     * 显示激励广告
     */
    fun showAd() {
        if (mttRewardVideoAd == null) {
            var map: MutableMap<String, Any?> = mutableMapOf(
                "adType" to "rewardAd",
                "onAdMethod" to "onUnReady",
                "error" to "广告预加载未完成"
            )
            FlutterMSEventPlugin.sendContent(map)
            return
        }
        bindAdListener()
        mIsLoaded = true
        mttRewardVideoAd?.showRewardVideoAd(
            mActivity,
            TTAdConstant.RitScenes.CUSTOMIZE_SCENES,
            "scenes_test"
        )
    }

    private fun getAdType(type: Int): String? {
        when (type) {
            TTAdConstant.AD_TYPE_COMMON_VIDEO -> return "普通激励视频，type=$type"
            TTAdConstant.AD_TYPE_PLAYABLE_VIDEO -> return "Playable激励视频，type=$type"
            TTAdConstant.AD_TYPE_PLAYABLE -> return "纯Playable，type=$type"
        }
        return "未知类型+type=$type"
    }
}