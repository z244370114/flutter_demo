package com.cg.driver.exam.ydqnt.plugin.meishu.custom.video

import android.content.Context
import android.media.MediaPlayer
import android.media.MediaPlayer.OnCompletionListener
import android.net.Uri
import android.view.View
import android.view.ViewGroup
import android.widget.VideoView
import com.baidu.mapapi.utils.FlutterBmfUtilsPlugin.getApplicationContext
import com.bytedance.sdk.openadsdk.AdSlot
import com.bytedance.sdk.openadsdk.AdSlot.Builder
import com.bytedance.sdk.openadsdk.TTAdNative
import com.bytedance.sdk.openadsdk.TTAdSdk
import com.bytedance.sdk.openadsdk.TTFeedAd
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import androidx.core.net.toUri


class VideoViewPlatformView(
    var context: Context,
    var messenger: BinaryMessenger,
    var id: Int,
    var params: Map<String, Any>
) : PlatformView {

    var channel: MethodChannel? = null
    var mCodeId: String? = null
    var viewWidth: Double? = 0.0
    var viewHeight: Double? = 0.0
    var mTTAdNative: TTAdNative? = null
    var videoView: VideoView? = null

    init {
        mCodeId = params["androidCodeId"] as String?
        viewWidth = params["width"] as Double
        viewHeight = params["height"] as Double
        channel = MethodChannel(messenger, FlutterMSViewConfig.splashAdView + "_" + id)
//        videoUrl?.let {
//            videoView.setVideoURI(Uri.parse(it))
//            videoView.setOnPreparedListener { mp ->
//                mp.isLooping = true
//                videoView.start()
//            }
//        }
    }


    fun loadVideoView() {
        val adSlot: AdSlot? = Builder().setCodeId(mCodeId).setImageAcceptedSize(640, 320) // 单位px
            .setAdCount(1) //请求广告数量为1到3条
            .build()

        mTTAdNative = TTAdSdk.getAdManager().createAdNative(context)

        mTTAdNative!!.loadStream(adSlot, object : TTAdNative.FeedAdListener {
            //请求广告失败
            override fun onError(code: Int, message: String?) {
            }

            //请求广告成功
            override fun onFeedAdLoad(ads: MutableList<TTFeedAd?>?) {
                if (ads == null || ads.isEmpty()) {
                    return
                }
                val tTFeedAd = ads[0]

                if (tTFeedAd?.customVideo == null) {
                    channel?.invokeMethod("onFail", "视频广告加载失败，可能是因为没有视频资源")
                    return
                }
                videoView = VideoView(context)
                videoView?.setOnCompletionListener(object : OnCompletionListener {
                    override fun onCompletion(mp: MediaPlayer?) {
                        // 播放器播放结束回调时，应该调用此处进行事件上报
                        if (tTFeedAd.customVideo != null) {
                            tTFeedAd.customVideo.reportVideoFinish()
                        }
                    }
                })

                videoView?.setVideoURI(tTFeedAd.customVideo.videoUrl.toUri())

                // 设置布局等
                val layoutParams =
                    ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
                videoView?.setLayoutParams(layoutParams)

                tTFeedAd.setVideoRewardListener(object : TTFeedAd.VideoRewardListener {
                    override fun onFeedRewardCountDown(p0: Int) {

                    }
                })
                tTFeedAd.setVideoAdListener(object : TTFeedAd.VideoAdListener {
                    override fun onVideoLoad(p0: TTFeedAd?) {

                    }

                    override fun onVideoError(p0: Int, p1: Int) {

                    }

                    override fun onVideoAdStartPlay(p0: TTFeedAd?) {

                    }

                    override fun onVideoAdPaused(p0: TTFeedAd?) {

                    }

                    override fun onVideoAdContinuePlay(p0: TTFeedAd?) {

                    }

                    override fun onProgressUpdate(p0: Long, p1: Long) {

                    }

                    override fun onVideoAdComplete(p0: TTFeedAd?) {
                    }
                })

//                if (mStreamAdPlayer != null) {
//                    mStreamAdPlayer.clear()
//                }
                // 使用自定义播放器需要考虑为视频Url预加载
                // 各家开发者的视频播放器个有不同
                // 需要预加载请在通过ttFeedAd.getCustomVideo().getVideoUrl()拿到视频url之后自行预加载
//                mStreamAdPlayer = StreamAdPlayer(ads, mAdLayout)
            }
        })
    }

    override fun getView(): View? {
        return videoView
    }

    override fun dispose() {
        videoView?.stopPlayback()
    }
}