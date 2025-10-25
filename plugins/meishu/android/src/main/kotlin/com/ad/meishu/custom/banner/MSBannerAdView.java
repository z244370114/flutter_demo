package com.ad.meishu.custom.banner;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.RelativeLayout;

import androidx.annotation.Nullable;

import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig;
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils;
import com.meishu.sdk.core.ad.MsAdSlot;
import com.meishu.sdk.core.ad.banner.BannerAdEventListener;
import com.meishu.sdk.core.ad.banner.IBannerAd;
import com.meishu.sdk.core.loader.InteractionListener;
import com.meishu.sdk.core.utils.AdErrorInfo;
import com.meishu.sdk.core.ad.banner.BannerAdLoader;

import java.util.HashMap;
import java.util.Map;


import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class MSBannerAdView implements PlatformView {

    String TAG = "MSBannerAdView";
    Context context;
    Activity activity;
    BinaryMessenger messenger;
    int id;
    HashMap<String, Object> params;
    String pid;
    double viewWidth;
    double viewHeight;

    RelativeLayout bannerContainer = null;

    BannerAdLoader bannerLoader;

    MethodChannel channel;

    BannerAdEventListener listener = new BannerAdEventListener() {

        @Override
        public void onAdError(AdErrorInfo adErrorInfo) {

        }


        /**
         * 广告已经准备完毕，此时可以进行广告的展示操作和相关逻辑处理
         */
        @Override
        public void onAdReady(IBannerAd bannerAd) {
            bannerContainer.removeAllViews();
            bannerContainer.addView(bannerAd.getAdView());
            bannerAd.showAd(bannerContainer);
            bannerAd.setInteractionListener(new InteractionListener() {
                @Override
                public void onAdClicked() {
                    // 点击监听
                }

                @Override
                public void onAdExposure() {
                    Log.e(TAG, "onAdExposure");
                    channel.invokeMethod("onEcpm", bannerAd.getData().getEcpm());
                }

                @Override
                public void onAdClosed() {
                    Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
                }
            });
        }
    };

    public MSBannerAdView(Context context, Activity activity, BinaryMessenger messenger, int viewId, Map<String, Object> params) {
        this.context = context;
        this.activity = activity;
        this.messenger = messenger;
        this.id = viewId;
        this.params = (HashMap<String, Object>) params;
        pid = params.get("androidCodeId").toString();
        viewWidth = (double) params.get("width");
        viewHeight = (double) params.get("height");
        bannerContainer = new RelativeLayout(context);
        channel = new MethodChannel(messenger, FlutterMSViewConfig.bannerAdView + "_" + id);
        initData();
    }

    private void initData() {
        MsAdSlot msAdSlot = new MsAdSlot.Builder()
                .setPid(pid)
                .setWidth((int) UIUtils.INSTANCE.dip2px(context, (float) viewWidth))
                .setHeight((int) UIUtils.INSTANCE.dip2px(context, (float) viewHeight))
                .build();
        bannerLoader = new BannerAdLoader(activity, msAdSlot, listener);
        bannerLoader.loadAd();
    }

    @Nullable
    @Override
    public View getView() {
        return bannerContainer;
    }

    @Override
    public void dispose() {
        bannerContainer.removeAllViews();
        bannerLoader.destroy();
    }
}