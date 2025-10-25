
package com.ad.meishu.custom.reward;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import androidx.annotation.Nullable;

import com.meishu.sdk.core.ad.MsAdSlot;
import com.meishu.sdk.core.ad.reward.RewardAdEventListener;
import com.meishu.sdk.core.ad.reward.RewardAdMediaListener;
import com.meishu.sdk.core.ad.reward.RewardVideoAd;
import com.meishu.sdk.core.ad.reward.RewardVideoLoader;
import com.meishu.sdk.core.loader.InteractionListener;
import com.meishu.sdk.core.utils.AdErrorInfo;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class MSRewardAdView implements PlatformView {
    String TAG = "MSRewardAdView";

    Context context;
    Activity activity;
    BinaryMessenger messenger;
    int id;
    HashMap<String, Object> params;
    String mCodeId;
    private ViewGroup rewardContainer;


    RewardAdEventListener adEventListener = new RewardAdEventListener() {
        @Override
        public void onVideoCached(RewardVideoAd ad) {
            Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
        }

        @Override
        public void onReward(Map<String, Object> map) {
            Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
        }

        @Override
        public void onAdError(AdErrorInfo adErrorInfo) {

        }

        @Override
        public void onAdReady(RewardVideoAd ad) {
            Log.e(TAG, "onAdReady: ad=" + ad);
            rewardContainer.addView(ad.getAdView());
            ad.setInteractionListener(new InteractionListener() {
                @Override
                public void onAdClicked() {
                    Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
                }

                @Override
                public void onAdExposure() {
                    Log.e(TAG, "ecpm=" + ad.getData().getEcpm());
                    Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
                }

                @Override
                public void onAdClosed() {
                    Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
                }

            });
            ad.setMediaListener(new RewardAdMediaListener() {
                @Override
                public void onVideoStart() {

                }

                @Override
                public void onVideoPause() {

                }

                @Override
                public void onVideoResume() {

                }

                @Override
                public void onVideoCompleted() {
                    Log.d(TAG, "DEMO ADEVENT " + (new Throwable().getStackTrace()[0].getMethodName()));
                }

                @Override
                public void onVideoError() {

                }

                @Override
                public void onSkippedVideo() {

                }
            });
        }
    };

    private RewardVideoLoader rewardVideoLoader;

    public MSRewardAdView(Context context, Activity activity, BinaryMessenger messenger, int viewId, Map<String, Object> params) {
        this.context = context;
        this.activity = activity;
        this.messenger = messenger;
        this.id = viewId;
        this.params = (HashMap<String, Object>) params;
        mCodeId = params.get("androidCodeId").toString();
        rewardContainer = new RelativeLayout(context);
        loadAd();
    }

    public void loadAd() {
        MsAdSlot msAdSlot = new MsAdSlot.Builder()
                .setPid(mCodeId)
                .build();
        rewardVideoLoader = new RewardVideoLoader(context, msAdSlot, adEventListener);

    }

    @Nullable
    @Override
    public View getView() {
        return rewardContainer;
    }

    @Override
    public void dispose() {
        rewardContainer.removeAllViews();
        rewardVideoLoader.destroy();
    }
}