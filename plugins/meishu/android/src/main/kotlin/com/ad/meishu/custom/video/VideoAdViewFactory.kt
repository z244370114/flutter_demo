package com.cg.driver.exam.ydqnt.plugin.meishu.custom.video

import android.app.Activity
import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class VideoAdViewFactory(private val messenger: BinaryMessenger, private val activity: Activity) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, id: Int, args: Any?): PlatformView {
        val params = args as Map<String, Any>
        return VideoViewPlatformView(context!!, messenger, id, params)
    }
}