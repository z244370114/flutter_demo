package com.ad.meishu.custom.paster;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.annotation.Nullable;

import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig;
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils;
import com.meishu.sdk.core.ad.MsAdSlot;
import com.meishu.sdk.core.ad.paster.PasterAd;
import com.meishu.sdk.core.ad.paster.PasterAdEventListener;
import com.meishu.sdk.core.ad.paster.PasterAdLoader;
import com.meishu.sdk.core.loader.InteractionListener;
import com.meishu.sdk.core.utils.AdErrorInfo;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class MSPasterAdView implements PlatformView {
    String TAG = "MSPasterAdView";

    Context context;
    Activity activity;
    BinaryMessenger messenger;
    int id;
    HashMap<String, Object> params;
    private ViewGroup videoContainer;

    String pid;
    double viewWidth;
    double viewHeight;

    MethodChannel channel;

    PasterAdLoader pasterAdLoader;
    PasterAd pasterAd;


    PasterAdEventListener listener = new PasterAdEventListener() {

        @Override
        public void onVideoLoaded() {
            pasterAd.start();
        }

        @Override
        public void onVideoComplete() {
            // 视频播放完成时回调
        }

        @Override
        public void onAdError(AdErrorInfo adErrorInfo) {

        }

        /**
         * 广告已经准备完毕，此时可以进行广告的展示操作和相关逻辑处理
         */
        @Override
        public void onAdReady(PasterAd ad) {
            pasterAd = ad;
            ad.setInteractionListener(new InteractionListener() {
                @Override
                public void onAdClicked() {
                    // 点击时可以把广告关掉
                    pasterAdLoader.destroy();
                    Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
                }

                @Override
                public void onAdExposure() {

                }

                @Override
                public void onAdClosed() {
                    pasterAdLoader.destroy();
                }
            });
        }
    };


    public MSPasterAdView(Context context, Activity activity, BinaryMessenger messenger, int viewId, Map<String, Object> params) {
        this.context = context;
        this.activity = activity;
        this.messenger = messenger;
        this.id = viewId;
        this.params = (HashMap<String, Object>) params;

        pid = params.get("androidCodeId").toString();
        viewWidth = (double) params.get("width");
        viewHeight = (double) params.get("height");
        videoContainer = new RelativeLayout(context);
        channel = new MethodChannel(messenger, FlutterMSViewConfig.bannerAdView + "_" + id);
        loadAd();
    }


    private void loadAd() {
        MsAdSlot msAdSlot = new MsAdSlot.Builder()
                .setPid(pid)
                .setWidth((int) UIUtils.INSTANCE.dip2px(context, (float) viewWidth))
                .setHeight((int) UIUtils.INSTANCE.dip2px(context, (float) viewHeight))
                .build();
        pasterAdLoader = new PasterAdLoader(context, videoContainer, msAdSlot, listener);
        pasterAdLoader.loadAd();
    }


    @Nullable
    @Override
    public View getView() {
        return videoContainer;
    }

    @Override
    public void dispose() {
        if (pasterAd != null) {
            pasterAd.destroy();
        }
        if (videoContainer != null) {
            videoContainer.removeAllViews();
        }
    }
}
