import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../flutter_ms_callback.dart';
import '../flutter_ms_code.dart';

class FlutterMSSplashAdView extends StatefulWidget {
  String androidCodeId;
  String iosCodeId;
  bool? supportDeepLink;
  double? width;
  double? height;
  int? timeout;
  bool? hideSkip;
  bool? isShake;
  bool? isFullScreen;
  FlutterMSSplashCallBack? callBack;

  /// # 开屏广告
  ///
  /// [androidCodeId] android 开屏广告广告id 必填
  ///
  /// [iosCodeId] ios 开屏广告广告id 必填
  ///
  /// [supportDeepLink] 是否支持 DeepLink 选填
  ///
  /// [width] 期望view 宽度 dp 选填 mIsExpress=true必填
  ///
  /// [height] 期望view高度 dp 选填 mIsExpress=true必填
  ///
  /// [FlutterMSSplashCallBack] 开屏广告回调
  ///
  /// [timeout] 开屏广告加载超时时间,建议大于3000,这里为了冷启动第一次加载到广告并且展示,示例设置了3000ms
  ///
  /// [hideSkip] 是否影藏跳过按钮(当影藏的时候显示自定义跳过按钮) 默认显示
  ///
  /// [isShake] 开屏摇一摇开关
  ///
  /// [callBack] 广告回调[FlutterMSSplashCallBack]
  ///
  FlutterMSSplashAdView({
    Key? key,
    required this.androidCodeId,
    required this.iosCodeId,
    this.supportDeepLink,
    this.width,
    this.height,
    this.timeout,
    this.hideSkip,
    this.callBack,
    this.isShake = false,
    this.isFullScreen = false,
  }) : super(key: key);

  @override
  _SplashAdViewState createState() {
    supportDeepLink = supportDeepLink ?? true;
    timeout = timeout ?? 3000;
    hideSkip = hideSkip ?? false;
    return _SplashAdViewState();
  }
}

class _SplashAdViewState extends State<FlutterMSSplashAdView> {
  final String _viewType = "com.bjwx.msad/SplashAdView";

  MethodChannel? _channel;

  //广告是否显示
  bool _isShowAd = true;

  @override
  void initState() {
    super.initState();
    _isShowAd = true;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowAd) {
      return const SizedBox.shrink();
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "androidCodeId": widget.androidCodeId,
            "supportDeepLink": widget.supportDeepLink,
            "width": widget.width ?? MediaQuery.of(context).size.width,
            "height": widget.height ?? MediaQuery.of(context).size.height,
            "timeout": widget.timeout,
            "hideSkip": widget.hideSkip,
            "isShake": widget.isShake,
            "isFullScreen": widget.isFullScreen,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "iosCodeId": widget.iosCodeId,
            "supportDeepLink": widget.supportDeepLink,
            "width": widget.width ?? MediaQuery.of(context).size.width,
            "height": widget.height ?? MediaQuery.of(context).size.height,
            "timeout": widget.timeout,
            "hideSkip": widget.hideSkip,
            "isShake": widget.isShake,
            "isFullScreen": widget.isFullScreen,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  //注册cannel
  void _registerChannel(int id) {
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      //显示广告
      case FlutterMSMethod.onShow:
        if (widget.callBack != null && widget.callBack?.onShow != null) {
          widget.callBack?.onShow!();
        }
        break;
      //广告加载失败
      case FlutterMSMethod.onFail:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
        }
        if (widget.callBack != null && widget.callBack?.onFail != null) {
          widget.callBack?.onFail!(call.arguments);
        }
        break;
      //开屏广告点击
      case FlutterMSMethod.onClick:
        if (widget.callBack != null && widget.callBack?.onClick != null) {
          widget.callBack?.onClick!();
        }
        break;
      //开屏广告跳过
      case FlutterMSMethod.onSkip:
        if (widget.callBack != null && widget.callBack?.onSkip != null) {
          widget.callBack?.onSkip!();
        }
        break;
      //开屏广告倒计时结束
      case FlutterMSMethod.onFinish:
        if (widget.callBack != null && widget.callBack?.onFinish != null) {
          widget.callBack?.onFinish!();
        }
        break;
      //开屏广告加载超时
      case FlutterMSMethod.onTimeOut:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
        }
        if (widget.callBack != null && widget.callBack?.onTimeOut != null) {
          widget.callBack?.onTimeOut?.call();
        }
        break;
      //开屏广告ecpm
      case FlutterMSMethod.onEcpm:
        if (widget.callBack != null && widget.callBack?.onEcpm != null) {
          widget.callBack?.onEcpm!(call.arguments);
        }
        break;
    }
  }
}
