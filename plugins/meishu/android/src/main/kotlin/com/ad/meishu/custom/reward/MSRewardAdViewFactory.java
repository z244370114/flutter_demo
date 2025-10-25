package com.ad.meishu.custom.reward;

import android.app.Activity;
import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;


import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MSRewardAdViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;
    private final Activity activity;

    public MSRewardAdViewFactory(BinaryMessenger messenger, Activity activity) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.activity = activity;
    }


    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        @SuppressWarnings("unchecked")
        Map<String, Object> params = (Map<String, Object>) args;
        return new MSRewardAdView(context, activity, messenger, viewId, params);
    }
}