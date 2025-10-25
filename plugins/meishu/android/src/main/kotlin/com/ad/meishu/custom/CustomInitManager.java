package com.ad.meishu.custom;

import android.content.Context;

import com.bytedance.sdk.openadsdk.TTAdConfig;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.TTAdSdk;
import com.meishu.sdk.core.AdSdk;

public class CustomInitManager {
    private static CustomInitManager sInstance;
    private TTAdConfig ttAdConfig;
    private boolean isInit;

    public synchronized static CustomInitManager getInstance() {
        if (sInstance == null) {
            sInstance = new CustomInitManager();
        }
        return sInstance;
    }

    public synchronized void initSdk(Context context, String appId, InitCallback callback) {
        if (TTAdSdk.isInitSuccess() || isInit) {
            if (callback != null) {
                callback.onSuccess();
            }
            return;
        }
        if (ttAdConfig == null) {
            ttAdConfig = buildTTConfig(appId);
            TTAdSdk.init(context.getApplicationContext(), ttAdConfig);
            TTAdSdk.start(new TTAdSdk.Callback() {
                @Override
                public void success() {

                }

                @Override
                public void fail(int i, String s) {

                }
            });
        }
    }

    private TTAdConfig buildTTConfig(String csjAppId) {

        TTAdConfig.Builder builder = new TTAdConfig.Builder();
        builder.appId(csjAppId)
//                .useTextureView(true) //使用TextureView控件播放视频,默认为SurfaceView,当有SurfaceView冲突的场景，可以使用TextureView
                .titleBarTheme(TTAdConstant.TITLE_BAR_THEME_DARK)
                .allowShowNotify(AdSdk.adConfig().enableNotify()) //是否允许sdk展示通知栏提示
                .supportMultiProcess(false);//是否支持多进程
                builder.debug(true); //测试阶段打开，可以通过日志排查问题，上线时去除该调用
        return builder.build();
    }


    public interface InitCallback {
        void onSuccess();

        void onError(int code, String msg);
    }

}
