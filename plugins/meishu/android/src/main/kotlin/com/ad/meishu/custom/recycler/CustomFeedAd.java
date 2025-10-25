
package com.ad.meishu.custom.recycler;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.TTFeedAd;
import com.bytedance.sdk.openadsdk.TTImage;
import com.bytedance.sdk.openadsdk.TTNativeAd;
import com.meishu.sdk.core.ad.recycler.RecyclerAdMediaListener;
import com.meishu.sdk.core.utils.MsAdPatternType;
import com.meishu.sdk.core.utils.MsInteractionType;
import com.meishu.sdk.platform.custom.recycler.MsCustomRecyclerAdapter;
import com.meishu.sdk.platform.custom.recycler.MsCustomRecyclerFeedAd;

import java.util.List;

public class CustomFeedAd extends MsCustomRecyclerFeedAd {

    private MsCustomRecyclerAdapter adWrapper;
    private TTFeedAd ttFeedAd;

    public CustomFeedAd(MsCustomRecyclerAdapter adWrapper, TTFeedAd ttFeedAd) {
        super(adWrapper);
        this.adWrapper = adWrapper;
        this.ttFeedAd = ttFeedAd;
    }


    @Override
    public int getAdPatternType() {
        int imageMode = ttFeedAd.getImageMode();
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
        switch (ttFeedAd.getInteractionType()){
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
        //创意点击views是指，点击对应的views会执行广告的目的，比如下载app、跳转目标网页等
        //clickableViews，在视频类广告中，点击clickableViews会跳转到视频页面
        //viewGroup参数必须为container的根view，否则穿山甲无法加载广告
        ttFeedAd.registerViewForInteraction(container, clickableViews, clickableViews, new TTNativeAd.AdInteractionListener() {
            @Override
            public void onAdClicked(View view, TTNativeAd ttNativeAd) {
                adWrapper.onFeedAdClicked(CustomFeedAd.this);
            }

            @Override
            public void onAdCreativeClick(View view, TTNativeAd ttNativeAd) {
                adWrapper.onFeedAdClicked(CustomFeedAd.this);
            }

            @Override
            public void onAdShow(TTNativeAd ttNativeAd) {
                adWrapper.onFeedAdExposure(CustomFeedAd.this);
            }
        });
    }

    @Override
    public void bindMediaView(ViewGroup mediaView, RecyclerAdMediaListener nativeRecyclerAdMediaListener) {
        ttFeedAd.setVideoAdListener(new TTFeedAd.VideoAdListener(){

            @Override
            public void onVideoLoad(TTFeedAd ttFeedAd) {
                if (nativeRecyclerAdMediaListener!=null){
                    nativeRecyclerAdMediaListener.onVideoLoaded();
                }
            }

            @Override
            public void onVideoError(int i, int i1) {
                if (nativeRecyclerAdMediaListener!=null){
                    nativeRecyclerAdMediaListener.onVideoError();
                }
            }

            @Override
            public void onVideoAdStartPlay(TTFeedAd ttFeedAd) {
                if (nativeRecyclerAdMediaListener!=null){
                    nativeRecyclerAdMediaListener.onVideoStart();
                }
            }

            @Override
            public void onVideoAdPaused(TTFeedAd ttFeedAd) {
                if (nativeRecyclerAdMediaListener!=null){
                    nativeRecyclerAdMediaListener.onVideoPause();
                }
            }

            @Override
            public void onVideoAdContinuePlay(TTFeedAd ttFeedAd) {

            }

            @Override
            public void onProgressUpdate(long l, long l1) {

            }

            @Override
            public void onVideoAdComplete(TTFeedAd ttFeedAd) {
                if (nativeRecyclerAdMediaListener!=null){
                    nativeRecyclerAdMediaListener.onVideoCompleted();
                }
            }
        });
        mediaView.removeAllViews();
        mediaView.addView(ttFeedAd.getAdView());
    }

    @Override
    public String getTitle() {
        return ttFeedAd.getTitle();
    }

    @Override
    public String getContent() {
        return ttFeedAd.getDescription();
    }

    @Override
    public String getActionText() {
        return null;
    }

    @Override
    public String getIconUrl() {
        return ttFeedAd.getIcon().getImageUrl();
    }

    @Override
    public String getIconTitle() {
        return null;
    }

    @Override
    public String getFromLogo() {
        return null;
    }

    @Override
    public String getFrom() {
        return null;
    }

    @Override
    public String getFromId() {
        return null;
    }

    @Override
    public String getAppName() {
        return null;
    }

    @Override
    public String getPackageName() {
        return null;
    }

    @Override
    public String getDesc() {
        return null;
    }

    @Override
    public String[] getImgUrls() {
        //穿山甲逻辑：大图、一图、三图，图片都在ImageList中
        String imgUrls[] = null;
        List<TTImage> images = ttFeedAd.getImageList();
        if (images != null) {
            imgUrls = new String[images.size()];
            int i = 0;
            for (TTImage image : images) {
                imgUrls[i++] = image.getImageUrl();
            }
        }
        return imgUrls;
    }

    @Override
    public String getVideoUrl() {
        return null;
    }

    @Override
    public long getDuration() {
        return 0;
    }

    @Override
    public int getWidth() {
        return 0;
    }

    @Override
    public int getHeight() {
        return 0;
    }

    @Override
    public void startVideo() {

    }

    @Override
    public void stopVideo() {

    }

    @Override
    public void pauseVideo() {

    }

    @Override
    public void resumeVideo() {

    }

    @Override
    public void replay() {

    }

    @Override
    public void mute() {

    }

    @Override
    public void unmute() {

    }

    @Override
    public void destroy() {
        if (ttFeedAd!=null){
            ttFeedAd.destroy();
            ttFeedAd=null;
        }
    }

    @Override
    public boolean isNativeExpress() {
        return false;
    }
}
