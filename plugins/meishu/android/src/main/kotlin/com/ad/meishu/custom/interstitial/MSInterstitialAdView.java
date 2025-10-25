package com.ad.meishu.custom.interstitial;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSEventPlugin;
import com.meishu.sdk.core.ad.MsAdSlot;
import com.meishu.sdk.core.ad.interstitial.InterstitialAd;
import com.meishu.sdk.core.ad.interstitial.InterstitialAdEventListener;
import com.meishu.sdk.core.ad.interstitial.InterstitialAdLoader;
import com.meishu.sdk.core.loader.InteractionListener;
import com.meishu.sdk.core.utils.AdErrorInfo;

import java.util.HashMap;
import java.util.Map;

public class MSInterstitialAdView {
    String TAG = "MSBannerAdView";
    Context context;
    Activity activity;
    String pid;
    private InterstitialAdLoader interstitialAdLoader;
    private InterstitialAd interstitialAds;

    InterstitialAdEventListener interstitialAdListener = new InterstitialAdEventListener() {

        @Override
        public void onAdError(AdErrorInfo errorInfo) {
            Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
            Map<String, Object> map = new HashMap<>();
            map.put("adType", "interactionAd");
            map.put("onAdMethod", "onFail");
            String error = (errorInfo != null) ? errorInfo.getCode() + " , " + errorInfo.getMessage() : "null";
            map.put("error", error);
            FlutterMSEventPlugin.Companion.sendContent(map);
        }

        /**
         * 广告已经准备完毕，此时可以进行广告的展示操作和相关逻辑处理
         */
        @Override
        public void onAdReady(InterstitialAd interstitialAd) {
            if (interstitialAd != null) {
                interstitialAds = interstitialAd;
            }
            loadShow();
            interstitialAd.setInteractionListener(new InteractionListener() {
                @Override
                public void onAdClicked() {
                    Map<String, Object> map = new HashMap<>();
                    map.put("adType", "interactionAd");
                    map.put("onAdMethod", "onClick");
                    FlutterMSEventPlugin.Companion.sendContent(map);
                }

                @Override
                public void onAdExposure() {
                    Map<String, Object> map = new HashMap<>();
                    map.put("adType", "interactionAd");
                    map.put("onAdMethod", "onShow");
                    FlutterMSEventPlugin.Companion.sendContent(map);
                }

                @Override
                public void onAdClosed() {
                    Map<String, Object> map = new HashMap<>();
                    map.put("adType", "interactionAd");
                    map.put("onAdMethod", "onClose");
                    FlutterMSEventPlugin.Companion.sendContent(map);
                    dispose();
                }
            });
        }
    };

    public MSInterstitialAdView(Context context, Activity activity, String pid) {
        this.context = context;
        this.activity = activity;
        this.pid = pid;
        loadAd();
    }

    public void loadAd() {
        MsAdSlot msAdSlot = new MsAdSlot.Builder()
                .setPid(pid)
                .setIsClickToClose(true)
                .build();
        interstitialAdLoader = new InterstitialAdLoader(activity, msAdSlot, interstitialAdListener);
        interstitialAdLoader.loadAd();
    }

    public void loadShow() {
        interstitialAds.showAd();
    }

    public void dispose() {
        if (interstitialAdLoader != null) {
            interstitialAdLoader.destroy();
        }
        if (interstitialAds != null) {
            interstitialAds = null;
        }
    }
}