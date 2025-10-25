
package com.ad.meishu.custom.recycler;
import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.TTAdDislike;
import com.bytedance.sdk.openadsdk.TTNativeExpressAd;
import com.meishu.sdk.core.ad.recycler.ExpressMediaListener;
import com.meishu.sdk.core.utils.MsAdPatternType;
import com.meishu.sdk.core.utils.MsInteractionType;
import com.meishu.sdk.platform.custom.recycler.MsCustomRecyclerAdapter;
import com.meishu.sdk.platform.custom.recycler.MsCustomRecyclerExpressAd;

import java.util.List;

public class CustomExpressAd extends MsCustomRecyclerExpressAd {
    private MsCustomRecyclerAdapter adWrapper;
    private TTNativeExpressAd ttNativeExpressAd;

    public CustomExpressAd(MsCustomRecyclerAdapter adWrapper, TTNativeExpressAd ttNativeExpressAd) {
        super(adWrapper);
        this.adWrapper = adWrapper;
        this.ttNativeExpressAd = ttNativeExpressAd;
    }

    @Override
    public int getAdPatternType() {
        int imageMode = ttNativeExpressAd.getImageMode();

        int adPatternType = MsAdPatternType.LARGE_IMAGE;
        switch (imageMode) {
            case TTAdConstant.IMAGE_MODE_VIDEO:
            case TTAdConstant.IMAGE_MODE_VIDEO_VERTICAL:
                adPatternType = MsAdPatternType.VIDEO;
                break;
            case TTAdConstant.IMAGE_MODE_LARGE_IMG:
                adPatternType = MsAdPatternType.LARGE_IMAGE;
                break;
            case TTAdConstant.IMAGE_MODE_SMALL_IMG:
                adPatternType = MsAdPatternType.SMALL_IMAGE;
                break;
            case TTAdConstant.IMAGE_MODE_GROUP_IMG:
                adPatternType = MsAdPatternType.THREE_IMAGE;
                break;
        }
        return adPatternType;
    }

    @Override
    public int getInteractionType() {
        int interactionType = MsInteractionType.NORMAL;
        switch (ttNativeExpressAd.getInteractionType()){
            case TTAdConstant.INTERACTION_TYPE_BROWSER:
            case TTAdConstant.INTERACTION_TYPE_LANDING_PAGE:
            case TTAdConstant.INTERACTION_TYPE_DIAL:
                interactionType = MsInteractionType.NORMAL;
                break;
            case TTAdConstant.INTERACTION_TYPE_DOWNLOAD:
                interactionType = MsInteractionType.DOWNLOAD_APP;
                break;
        }
        return interactionType;
    }


    @Override
    public void bindAdToView(Context context, ViewGroup container, List<View> clickableViews) {
        Activity dialogContext=null;
        if (context instanceof Activity){
            dialogContext= (Activity) context;
        }else if (container.getContext() instanceof Activity){
            dialogContext = (Activity) container.getContext();
        }
        try {
            if (dialogContext != null && !dialogContext.isFinishing()){
                if (ttNativeExpressAd!=null){
                    ttNativeExpressAd.setDislikeCallback(dialogContext, new TTAdDislike.DislikeInteractionCallback() {
                        @Override
                        public void onShow() {

                        }

                        @Override
                        public void onSelected(int i, String s, boolean b) {
                            adWrapper.onExpressAdClosed(CustomExpressAd.this);
                        }

                        @Override
                        public void onCancel() {

                        }
                    });
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (container != null && getAdView() != null) {
            container.removeAllViews();
            container.addView(getAdView());
        }
    }

    @Override
    public void setExpressMediaListener(final ExpressMediaListener mediaListener) {
        if (ttNativeExpressAd!=null){
            ttNativeExpressAd.setVideoAdListener(new TTNativeExpressAd.ExpressVideoAdListener() {
                @Override
                public void onVideoLoad() {
                    if (mediaListener!=null){
                        mediaListener.onVideoLoaded();
                    }
                }

                @Override
                public void onVideoError(int i, int i1) {
                    if (mediaListener!=null){
                        mediaListener.onVideoError(i,"错误信息 "+i1);
                    }
                }

                @Override
                public void onVideoAdStartPlay() {
                    if (mediaListener!=null){
                        mediaListener.onVideoStart();
                    }
                }

                @Override
                public void onVideoAdPaused() {
                    if (mediaListener!=null){
                        mediaListener.onVideoPause();
                    }
                }

                @Override
                public void onVideoAdContinuePlay() {
                    if (mediaListener!=null){
                        mediaListener.onVideoResume();
                    }
                }

                @Override
                public void onProgressUpdate(long l, long l1) {

                }

                @Override
                public void onVideoAdComplete() {
                    if (mediaListener!=null){
                        mediaListener.onVideoCompleted();
                    }
                }

                @Override
                public void onClickRetry() {

                }
            });
        }
    }

    @Override
    public View getAdView() {
        return ttNativeExpressAd.getExpressAdView();
    }

    @Override
    public void destroy() {
        if (ttNativeExpressAd!=null){
            ttNativeExpressAd.destroy();
            ttNativeExpressAd=null;
        }
    }

    @Override
    public boolean isNativeExpress() {
        return true;
    }
}
