
package com.ad.meishu.custom.splash;

import static com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash.MSSplashAdPreloadCache.*;

import android.app.Activity;
import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.cg.driver.exam.ydqnt.plugin.meishu.custom.splash.MSSplashAdPreloadCache;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class MSSplashAdViewFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;
    private final Activity activity;

    public MSSplashAdViewFactory(BinaryMessenger messenger, Activity activity) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
        this.activity = activity;
    }


    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        @SuppressWarnings("unchecked")
        Map<String, Object> params = (Map<String, Object>) args;
        return MSSplashAdPreloadCache.getPreloadedAdView(context, activity, messenger, viewId, params);
//        return new MSSplashAdView(context, activity, messenger, viewId, params);
    }
}
