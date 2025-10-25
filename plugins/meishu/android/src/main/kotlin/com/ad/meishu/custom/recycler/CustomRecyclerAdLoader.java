
package com.ad.meishu.custom.recycler;
import com.bytedance.sdk.openadsdk.TTAdNative;
import com.bytedance.sdk.openadsdk.TTAdSdk;
import com.meishu.sdk.core.ad.recycler.RecyclerMixAdLoader;
import com.meishu.sdk.core.domain.SdkAdInfo;
import com.meishu.sdk.platform.custom.recycler.MsCustomRecyclerAdapter;

public class CustomRecyclerAdLoader extends MsCustomRecyclerAdapter {
    private final TTAdNative ttAdNative;

    public CustomRecyclerAdLoader(RecyclerMixAdLoader adLoader, SdkAdInfo sdkAdInfo) {
        super(adLoader, sdkAdInfo);
        this.ttAdNative = TTAdSdk.getAdManager().createAdNative(adLoader.getContext().getApplicationContext());
    }

    @Override
    public void loadCustomAd(String app_id,String app_key, String pid,String custom_ext) {

    }


}
