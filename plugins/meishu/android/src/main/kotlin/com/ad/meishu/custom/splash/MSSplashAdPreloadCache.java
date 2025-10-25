package com.ad.meishu.custom.splash;

import android.app.Activity;
import android.content.Context;
import android.util.Log;

import androidx.annotation.Nullable;

import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig;
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils;
import com.meishu.sdk.core.ad.MsAdSlot;
import com.meishu.sdk.core.ad.splash.ISplashAd;
import com.meishu.sdk.core.ad.splash.SplashAdEventListener;
import com.meishu.sdk.core.ad.splash.SplashAdLoader;
import com.meishu.sdk.core.utils.AdErrorInfo;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MSSplashAdPreloadCache {
    public static final String TAG = "MSSplashAdPreload";
    public static SplashAdLoader preloadedSplashAd; // 美数SDK的预加载广告对象
    public static ISplashAd splashAds; // 美数SDK的预加载广告对象
    public static MSSplashAdView preloadedAdView; // 可选：预渲染的广告视图
    public static boolean isLoading = false;
    public static String currentPreloadingAdUnitId; // 标识当前正在预加载的广告单元ID
    static MethodChannel methodChannel;

    static SplashAdEventListener splashAdEventListener = new SplashAdEventListener() {
        @Override
        public void onAdError(AdErrorInfo adErrorInfo) {
            Log.w(TAG, "onAdError");
            methodChannel.invokeMethod("onFail", adErrorInfo.getMessage());
            isLoading = false;
        }

        @Override
        public void onAdTick(long l) {

        }

        @Override
        public void onAdTimeOver(ISplashAd iSplashAd) {
            methodChannel.invokeMethod("onFinish", "开屏广告倒计时结束");
            clearPreloadedAd(currentPreloadingAdUnitId);
        }

        @Override
        public void onAdSkip(ISplashAd iSplashAd) {
            methodChannel.invokeMethod("onSkip", "开屏广告点击跳过");
            clearPreloadedAd(currentPreloadingAdUnitId);
        }


        @Override
        public void onAdReady(ISplashAd iSplashAd) {
            if (splashAds == null) {
                splashAds = iSplashAd;
            }
            Log.w(TAG, "onAdReady");
        }
    };

    /**
     * 开始预加载广告
     *
     * @param activity 当前 Activity
     * @param params   Flutter传递过来的参数，可能包含广告请求需要的额外信息
     */
    public static void preloadAd(Activity activity, Map<String, Object> params) {
        String adUnitId = (String) params.get("androidCodeId"); // 获取 Flutter 传递的宽度参数
        if (isLoading) {
            Log.d(TAG, "广告正在加载中，跳过本次预加载请求: " + adUnitId);
            return;
        }
        if (preloadedSplashAd != null && currentPreloadingAdUnitId != null && currentPreloadingAdUnitId.equals(adUnitId)) {
            Log.d(TAG, "广告单元 " + adUnitId + " 已预加载，跳过。");
            return;
        }
        if (preloadedSplashAd != null) {
            Log.d(TAG, "新的广告单元 " + adUnitId + " 与已预加载的 " + currentPreloadingAdUnitId + " 不同，清除旧的。");
            clearPreloadedAd(currentPreloadingAdUnitId);
        }
        double width = (double) params.get("width");
        double height = (double) params.get("height");
        boolean isFullScreen = (boolean) params.get("isFullScreen");
        int heightPx = 0;
        if (isFullScreen) {
            heightPx = (int) UIUtils.INSTANCE.dip2px(activity, (float) height);
        } else {
            heightPx = (int) (UIUtils.INSTANCE.dip2px(activity, (float) height) - UIUtils.INSTANCE.dip2px(activity, 150));
        }
        isLoading = true;
        currentPreloadingAdUnitId = adUnitId;
        Log.d(TAG, "开始预加载广告单元: " + adUnitId);
        MsAdSlot msAdSlot = new MsAdSlot.Builder()
                .setPid(adUnitId)
                .setFetchCount(1)
                .setWidth((int) UIUtils.INSTANCE.dip2px(activity, (float) width))
                .setHeight(heightPx)
                .setIsHideSkipBtn(false)
                .build();
        preloadedSplashAd = new SplashAdLoader(
                activity,
                msAdSlot,
                splashAdEventListener,
                3000
        );
        preloadedSplashAd.loadAd();
    }

    @Nullable
    public static MSSplashAdView getPreloadedAdView(Context context, Activity activity, BinaryMessenger messenger, int viewId, Map<String, Object> params) {
        methodChannel = new MethodChannel(messenger, FlutterMSViewConfig.splashAdView + "_" + viewId);
        String requestedAdUnitId = (String) params.get("androidCodeId");
        preloadedAdView = new MSSplashAdView(context, activity, methodChannel, viewId, params);
        if (currentPreloadingAdUnitId != null && currentPreloadingAdUnitId.equals(requestedAdUnitId) && preloadedSplashAd != null) {
            preloadedAdView.loadAdWithPreloadedData(splashAds); // 你需要在 MSSplashAdView 中实现这个新方法
            preloadedSplashAd = null;
            currentPreloadingAdUnitId = null;
            isLoading = true;
        } else {
            preloadedAdView.loadAdInternal();
        }
        return preloadedAdView;
    }

    public static void clearPreloadedAd(@Nullable String adUnitId) {
        if (adUnitId != null && adUnitId.equals(currentPreloadingAdUnitId)) {
            if (preloadedSplashAd != null) {
                preloadedSplashAd.destroy();
                preloadedSplashAd = null;
            }
            if (splashAds != null) {
                splashAds = null;
            }
            if (preloadedAdView != null) {
                preloadedAdView.dispose();
                preloadedAdView = null;
            }
            isLoading = false; // 如果是因为超时等原因清除，可能需要重置isLoading
            currentPreloadingAdUnitId = null;
            Log.d(TAG, "清除了广告单元 " + adUnitId + " 的预加载缓存。");
        }
    }

    public static boolean isAdLoading() {
        return isLoading;
    }

    public static boolean hasPreloadedAd(String adUnitId) {
        return currentPreloadingAdUnitId != null && currentPreloadingAdUnitId.equals(adUnitId) &&
                (preloadedSplashAd != null || preloadedAdView != null);
    }
}