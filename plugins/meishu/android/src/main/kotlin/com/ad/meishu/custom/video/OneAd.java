package com.ad.meishu.custom.video;

import android.view.View;
import android.widget.VideoView;

import com.bytedance.sdk.openadsdk.TTFeedAd;

class OneAd {
    // 开发者自定义的播放器View
    View adView;
    double duration;
    // 广告对象
    TTFeedAd ttFeedAd;

    public OneAd(View adView, double duration, TTFeedAd ttFeedAd) {
        this.adView = adView;
        this.duration = duration;
        this.ttFeedAd = ttFeedAd;
    }

    public void play() {
        if (adView instanceof VideoView) {
            ((VideoView) adView).start();
            if (ttFeedAd.getCustomVideo() != null) {
                // 使用自定义播放器需要上报视频播放的埋点
                ttFeedAd.getCustomVideo().reportVideoStart();
            }
        }
    }

    public void stop() {
        if (adView instanceof VideoView) {
            if (ttFeedAd.getCustomVideo() != null) {
                // 使用自定义播放器需要上报视频播放结束的埋点
                ttFeedAd.getCustomVideo().reportVideoBreak(((VideoView) adView).getCurrentPosition());
            }
        }
    }

    public void pauseVideo() {
        if (adView instanceof VideoView) {
            ((VideoView) adView).pause();
            if (ttFeedAd.getCustomVideo() != null) {
                // 使用自定义播放器需要上报视频暂停埋点
                ttFeedAd.getCustomVideo().reportVideoPause(((VideoView) adView).getCurrentPosition());
            }
        }
    }

    public void continueVideo() {
        if (adView instanceof VideoView) {
            // Android 自带的VideoView继续播放有关键帧问题
            // 请使用自己的播放器自行处理继续播放的问题
            ((VideoView) adView).start();

            if (ttFeedAd.getCustomVideo() != null) {
                // 使用自定义播放器需要上报视频继续播放埋点
                ttFeedAd.getCustomVideo().reportVideoContinue(((VideoView) adView).getCurrentPosition());
            }
        }
    }
}