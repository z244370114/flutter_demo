package com.ad.meishu.custom.banner;

import android.app.Activity;
import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;


import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MSBannerAdViewFactory extends PlatformViewFactory {
    private static final String TAG = "MSBannerAdViewFactory";
    private final BinaryMessenger messenger;
    private final Activity activity;

    public MSBannerAdViewFactory(BinaryMessenger messenger, Activity activity) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.activity = activity;
    }

    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        Map<String, Object> params = (Map<String, Object>) args;
        return new MSBannerAdView(context, activity, messenger, viewId, params);
    }
}
