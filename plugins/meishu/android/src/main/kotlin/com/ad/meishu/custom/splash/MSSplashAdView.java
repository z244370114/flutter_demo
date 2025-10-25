package com.ad.meishu.custom.splash;

import static com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash.MSSplashAdPreloadCache.clearPreloadedAd;
import static com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash.MSSplashAdPreloadCache.currentPreloadingAdUnitId;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import androidx.annotation.NonNull;
import androidx.core.content.ContextCompat;

import com.cg.driver.exam.ydqnt.R;
import com.cg.driver.exam.ydqnt.plugin.meishu.FlutterMSViewConfig;
import com.cg.driver.exam.ydqnt.plugin.meishu.ResultBeanUtil;
import com.cg.driver.exam.ydqnt.plugin.meishu.UIUtils;
import com.meishu.sdk.core.ad.MsAdSlot;
import com.meishu.sdk.core.ad.splash.ISplashAd;
import com.meishu.sdk.core.ad.splash.SplashAdEventListener;
import com.meishu.sdk.core.ad.splash.SplashAdLoader;
import com.meishu.sdk.core.loader.InteractionListener;
import com.meishu.sdk.core.utils.AdErrorInfo;

import java.util.Map;
import java.util.Objects;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class MSSplashAdView implements PlatformView {

    SplashAdLoader mSdkSplashAd;
    ISplashAd splashAds;
    boolean isPreloadedDataUsed = false;
    RelativeLayout splashContainer;
    FrameLayout contentFrame;

    String currentAdId;

    static final String TAG = "MSSplashAdView";
    Context context;
    Activity activity;
    int viewId;
    MethodChannel methodChannel;

    double width;
    double height;
    boolean isFullScreen;

    InteractionListener interactionListener = new InteractionListener() {
        @Override
        public void onAdClicked() {
            methodChannel.invokeMethod("onClick", "开屏广告点击");
        }

        @Override
        public void onAdExposure() {
            methodChannel.invokeMethod("onShow", "开屏广告显示");
            methodChannel.invokeMethod("onEcpm", ResultBeanUtil.toMap(splashAds.getData()));
        }

        @Override
        public void onAdClosed() {
            methodChannel.invokeMethod("onFinish", "开屏广告关闭");
            dispose();
        }
    };

    public MSSplashAdView(Context context, Activity activity, MethodChannel methodChannel, int viewId, Map<String, Object> params) {
        this.context = context; // Standard Context
        this.activity = activity; // Activity Context
        this.viewId = viewId;
        this.currentAdId = (String) params.get("androidCodeId");
        this.width = (double) params.get("width");
        this.height = (double) params.get("height");
        this.isFullScreen = (boolean) params.get("isFullScreen");
        this.methodChannel = methodChannel;
        splashContainer = new RelativeLayout(context);
        if (!isFullScreen) {
            View view = LayoutInflater.from(context).inflate(R.layout.splash_layout, splashContainer, true);
            contentFrame = view.findViewById(R.id.fl_content);
        }
    }

    public void loadAdWithPreloadedData(ISplashAd splashAds) {
        methodChannel.invokeMethod("onShow", "开屏广告点击显示");
        if (!isFullScreen) {
            splashAds.showAd(contentFrame);
        } else {
            splashAds.showAd(splashContainer);
        }
        splashAds.setInteractionListener(interactionListener);
        Log.d(TAG, "MSSplashAdView: " + currentAdId + " - 使用预加载的广告数据进行加载。");
    }

    /// 直接加载显示广告
    public void loadAdInternal() {
        if (isPreloadedDataUsed) { // 如果数据已经通过预加载设置，则不再执行此方法
            return;
        }
        int heightPx = 0;
        if (isFullScreen) {
            heightPx = (int) UIUtils.INSTANCE.dip2px(activity, (float) height);
        } else {
            heightPx = (int) (UIUtils.INSTANCE.dip2px(activity, (float) height) - UIUtils.INSTANCE.dip2px(activity, 150));
        }
        MsAdSlot msAdSlot = new MsAdSlot.Builder()
                .setPid(currentAdId)
                .setFetchCount(1)
                .setWidth((int) UIUtils.INSTANCE.dip2px(context, (float) width))
                .setHeight(heightPx)
                .setIsHideSkipBtn(false)
                .build();

        mSdkSplashAd = new SplashAdLoader(
                activity,
                msAdSlot,
                new SplashAdEventListener() {
                    @Override
                    public void onAdError(AdErrorInfo adErrorInfo) {
                        methodChannel.invokeMethod("onFail", adErrorInfo.getMessage());
                    }

                    @Override
                    public void onAdTick(long l) {

                    }

                    @Override
                    public void onAdTimeOver(ISplashAd iSplashAd) {
                        methodChannel.invokeMethod("onFinish", "开屏广告倒计时结束");
                        dispose();
                    }

                    @Override
                    public void onAdSkip(ISplashAd iSplashAd) {
                        methodChannel.invokeMethod("onSkip", "开屏广告点击跳过");
                        dispose();
                    }

                    @Override
                    public void onAdReady(ISplashAd iSplashAd) {
                        if (splashAds == null) {
                            splashAds = iSplashAd;
                        }
                        if (!isFullScreen) {
                            splashAds.showAd(contentFrame);
                        } else {
                            splashAds.showAd(splashContainer);
                        }
                        splashAds.setInteractionListener(interactionListener);
                    }
                },
                5000
        );
        mSdkSplashAd.loadAd();
    }

    @NonNull
    @Override
    public View getView() {
        return splashContainer; // 返回包含广告的容器
    }

    @Override
    public void dispose() {
        if (contentFrame != null) {
            contentFrame.removeAllViews();
            contentFrame = null;
        }
        if (splashContainer != null) {
            splashContainer.removeAllViews();
            splashContainer = null;
        }
        if (mSdkSplashAd != null) {
            mSdkSplashAd.destroy(); // 或其他类似方法
            mSdkSplashAd = null;
        }
        if (splashAds != null) {
            splashAds = null;
        }
    }
}