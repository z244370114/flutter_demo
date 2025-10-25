package com.cg.driver.exam.ydqnt.plugin.meishu.custom

import android.content.Context
import com.meishu.sdk.core.AdSdk
import com.meishu.sdk.core.MSAdConfig

class MSInitManager {
    var sdkConfig: MSAdConfig? = null
    private val isInit = false

    @Synchronized
    fun initSdk(context: Context?, appId: String, callback: InitCallback) {
        sdkConfig = buildTTConfig(appId)
        AdSdk.init(context, sdkConfig!!)
        callback.onSuccess()
    }

    private fun buildTTConfig(appId: String): MSAdConfig {
        sdkConfig = MSAdConfig.Builder()
            .appId(appId)
            .enableDebug(true) //开启DEBUG模式，打印内部LOG
            .downloadConfirm(MSAdConfig.DOWNLOAD_CONFIRM_ALWAYS) //下载提示模式
            .build()
        return sdkConfig!!
    }


    interface InitCallback {
        fun onSuccess()

        fun onError(code: Int, msg: String?)
    }

    companion object {
        private var sInstance: MSInitManager? = null

        @JvmStatic
        @get:Synchronized
        val instance: MSInitManager
            get() {
                if (sInstance == null) {
                    sInstance = MSInitManager()
                }
                return sInstance!!
            }
    }
}
