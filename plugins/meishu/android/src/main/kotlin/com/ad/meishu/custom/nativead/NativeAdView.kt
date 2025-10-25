package com.cg.driver.exam.ydqnt.plugin.meishu.custom.nativead

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.FrameLayout
import android.widget.RelativeLayout
import android.widget.TextView
import android.widget.VideoView
import com.cg.driver.exam.ydqnt.R
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils
import com.meishu.sdk.core.ad.MsAdSlot
import com.meishu.sdk.core.ad.recycler.ExpressMediaListener
import com.meishu.sdk.core.ad.recycler.RecyclerAdData
import com.meishu.sdk.core.ad.recycler.RecyclerAdEventListener
import com.meishu.sdk.core.ad.recycler.RecyclerAdMediaListener
import com.meishu.sdk.core.ad.recycler.RecyclerMixAdLoader
import com.meishu.sdk.core.ad.recycler.RecylcerAdInteractionListener
import com.meishu.sdk.core.utils.AdErrorInfo
import com.meishu.sdk.core.utils.MsAdPatternType
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class NativeAdView(
    var context: Context,
    var activity: Activity,
    var messenger: BinaryMessenger,
    id: Int,
    params: Map<String?, Any?>,
) : PlatformView {
    val TAG = "NativeExpressAdView"
    var mContainer: RelativeLayout? = null
    var videoView: RelativeLayout? = null
    var mCodeId: String? = null
    var supportDeepLink: Boolean? = true
    var viewWidth: Double
    var viewHeight: Double
    var isMuted: Boolean? = true
    var isAdType: Boolean? = false
    var recyclerMixAdLoader: RecyclerMixAdLoader? = null
    var ad: RecyclerAdData? = null


    private var channel: MethodChannel? = null

    val recyclerAdEventListener = object : RecyclerAdEventListener {
        override fun onAdError(errorInfo: AdErrorInfo?) {
            channel?.invokeMethod("onFail", "信息流广告加载失败")
            dispose()
        }

        override fun onAdReady(list: MutableList<RecyclerAdData?>) {
            val clickableViews: MutableList<View?> = ArrayList<View?>()
//            var button = Button(context)
//            button.text = "关闭"
//            mContainer?.addView(button)
            clickableViews.add(mContainer)
            if (list.isNotEmpty()) {
                ad = list[0]
            }
            ad?.bindAdToView(activity, mContainer!!, clickableViews, object : RecylcerAdInteractionListener {
                override fun onAdClosed() {
                    Log.e(TAG, "onAdClosed")
                    channel?.invokeMethod("onClose", "信息流广告关闭")
                    ad?.destroy()
                    dispose()
                }

                override fun onAdRenderFailed() {
                    Log.e(TAG, "onAdRenderFailed")
                    channel?.invokeMethod("onFail", "自渲染信息流广告 暂不支持")
                    ad?.destroy()
                }

                override fun onAdExposure() {
                    Log.e(TAG, "onAdExposure")
                    channel?.invokeMethod("onShow", "信息流广告展示")
                }

                override fun onAdClicked() {
                    channel?.invokeMethod("onClick", "信息流广告点击")
                    Log.e(TAG, "onAdClicked")
                }
            })
            if (ad?.adPatternType == MsAdPatternType.VIDEO) {
                ad?.bindMediaView(videoView, object : RecyclerAdMediaListener {
                    override fun onVideoStart() {
                        channel?.invokeMethod("onShow", "信息流广告视频开始播放")
//                        val button = Button(context)
//                        button.text = "关闭"
//                        button.setTextColor(context.getColor(android.R.color.white))
//                        button.background = context.resources.getDrawable(android.R.color.transparent)
//                        val layoutParams = RelativeLayout.LayoutParams(
//                            RelativeLayout.LayoutParams.WRAP_CONTENT, // 按钮的宽度
//                            RelativeLayout.LayoutParams.WRAP_CONTENT  // 按钮的高度
//                        )
//
//                        layoutParams.addRule(RelativeLayout.ALIGN_PARENT_TOP) // 对齐父容器的顶部
//                        layoutParams.addRule(RelativeLayout.ALIGN_PARENT_RIGHT) // 对齐父容器的右侧 (或 ALIGN_PARENT_END)
//
//                        val marginInDp = 8 // 例如 8dp 的边距
//                        val marginInPx = UIUtils.dip2px(context, marginInDp.toFloat()).toInt() // 使用你的 UIUtils 工具类转换
//                        layoutParams.setMargins(0, marginInPx, marginInPx, 0) // 左, 上, 右, 下
//
//                        button.layoutParams = layoutParams
//                        button.setOnClickListener {
//                            channel?.invokeMethod("onClose", "手动关闭")
//                            ad?.destroy()
//                            dispose()
//                        }
//                        mContainer?.addView(button)
                    }

                    override fun onVideoPause() {
                        channel?.invokeMethod("onPause", "信息流广告视频暂停播放")
                    }

                    override fun onVideoCompleted() {
                        channel?.invokeMethod("onVideoStop", "信息流广告视频播放完成")
                        ad?.destroy()
                        dispose()
                    }

                    override fun onVideoError() {
                        channel?.invokeMethod("onFail", "信息流广告视频播放失败")
                        ad?.destroy()
                        dispose()
                    }

                    override fun onVideoResume() {
                        channel?.invokeMethod("onResume", "信息流广告视频继续播放")
                    }
                })
            }


            ad?.setExpressMediaListener(object : ExpressMediaListener {
                override fun onVideoLoaded() {
                    Log.e(TAG, "onVideoLoaded")
                }

                override fun onVideoStart() {
                    Log.e(TAG, "onVideoStart")
                }

                override fun onVideoPause() {
                    Log.e(TAG, "onVideoPause")
                }

                override fun onVideoCompleted() {
                    Log.e(TAG, "onVideoCompleted")
                }

                override fun onVideoError(code: Int, msg: String?) {
                    Log.e(TAG, "onVideoError")
                }

                override fun onVideoResume() {
                    Log.e(TAG, "onVideoResume")
                }
            })
        }
    }

    init {
        mCodeId = params["androidCodeId"] as String?
        supportDeepLink = params["supportDeepLink"] as Boolean?
        viewWidth = params["width"] as Double
        viewHeight = params["height"] as Double
        isMuted = params["isMuted"] as Boolean
        isAdType = params["isAdType"] as Boolean
        mContainer = RelativeLayout(context)
        channel = MethodChannel(messenger, FlutterMSViewConfig.nativeAdView + "_" + id)
        isAdType?.let {
            if (!it) {
                val view: View = LayoutInflater.from(context).inflate(R.layout.video_layout, mContainer, true)
                videoView = view.findViewById<RelativeLayout?>(R.id.videoView)
                view.findViewById<TextView?>(R.id.close).setOnClickListener {
                    channel?.invokeMethod("onClose", "手动关闭")
                    ad?.destroy()
                    dispose()
                }
            }
        }
        channel?.setMethodCallHandler { call, result ->
            {
                if (call.method == "dispose") {
                    ad?.destroy()
                    dispose()
                    result.success("原生已收到: ")
                } else {
                    result.notImplemented()
                }
            }
        }
        loadNativeAd()
    }

    override fun getView(): View? {
        return mContainer
    }

    private fun loadNativeAd() {
        if (recyclerMixAdLoader == null) {
            val msAdSlot = MsAdSlot.Builder()
                .setPid(mCodeId.toString())
                .setFetchCount(1)
                .setWidth(UIUtils.dip2px(context, viewWidth.toFloat()).toInt())
                .setHeight(UIUtils.dip2px(context, viewHeight.toFloat()).toInt())
                .setIsshowDetail(false)
                .build()
            recyclerMixAdLoader = RecyclerMixAdLoader(context, msAdSlot, recyclerAdEventListener)
        }
        recyclerMixAdLoader?.loadAd()
    }

    override fun dispose() {
        mContainer?.removeAllViews()
        videoView?.removeAllViews()
        recyclerMixAdLoader?.destroy()
        recyclerMixAdLoader = null
        videoView = null
        mContainer = null
    }
}