import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../flutter_ms_callback.dart';
import '../flutter_ms_code.dart';

class FlutterMSNativeAdView extends StatefulWidget {
  String androidCodeId;
  String iosCodeId;
  bool? supportDeepLink;
  double width;
  double height;
  final bool isMuted;
  final bool isAdType;
  FlutterMSNativeCallBack? callBack;

  /// # 信息流广告
  ///
  /// [androidCodeId] android 信息流广告id 必填
  ///
  /// [iosCodeId] ios 信息流广告id 必填
  ///
  /// [supportDeepLink] 是否支持 DeepLink 选填
  ///
  /// [width] 期望view 宽度 dp 必填
  ///
  /// [height] 期望view高度 dp 必填
  ///
  /// [isMuted] 是否静音
  ///
  /// [FlutterMSNativeCallBack] 信息流广告回调
  ///
  FlutterMSNativeAdView(
      {Key? key,
      required this.androidCodeId,
      required this.iosCodeId,
      required this.supportDeepLink,
      required this.width,
      required this.height,
      this.isMuted = true,
      this.isAdType = true,
      this.callBack})
      : super(key: key);

  @override
  _NativeAdViewState createState() {
    supportDeepLink = supportDeepLink ?? true;
    return _NativeAdViewState();
  }
}

class _NativeAdViewState extends State<FlutterMSNativeAdView> {
  String _viewType = "com.bjwx.msad/NativeAdView";

  static MethodChannel? _channel;

  //广告是否显示
  bool _isShowAd = true;

  //宽高
  double _width = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();
    _isShowAd = true;
    _width = widget.width;
    _height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowAd) {
      return SizedBox.shrink();
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return SizedBox(
        width: _width,
        height: _height == 0 ? 0.5 : _height, //高为0的时候不会原生不会加载 默认设为0.5
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "androidCodeId": widget.androidCodeId,
            "supportDeepLink": widget.supportDeepLink,
            "width": widget.width,
            "height": widget.height,
            "isMuted": widget.isMuted,
            "isAdType": widget.isAdType,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        width: _width,
        height: _height == 0 ? 0.5 : _height, //高为0的时候原生不会加载 默认设为0.5
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "iosCodeId": widget.iosCodeId,
            "supportDeepLink": widget.supportDeepLink,
            "width": widget.width,
            "height": widget.height,
            "isMuted": widget.isMuted,
            "isAdType": widget.isAdType,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  //注册cannel
  void _registerChannel(int id) {
    print("FlutterMSNativeAdView _registerChannel ${_viewType}_$id");
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  void sendDispose() async {
    try {
      final result = await _channel?.invokeMethod('dispose');
      print('原生响应: $result');
    } catch (e) {
      print('调用原生失败: $e');
    }
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      //显示广告
      case FlutterMSMethod.onShow:
        widget.callBack?.onShow!();
        Map map = call.arguments;
        if (mounted) {
          setState(() {
            _isShowAd = true;
            if (map["width"] > 0) {
              _width = (map["width"]).toDouble();
              _height = (map["height"]).toDouble();
            }
          });
        }
        break;
      //广告加载失败
      case FlutterMSMethod.onFail:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
          sendDispose();
        }
        widget.callBack?.onFail!(call.arguments);
        break;
      //广告不感兴趣
      case FlutterMSMethod.onDislike:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
        }
        widget.callBack?.onDislike!(call.arguments);
        break;
      //点击
      case FlutterMSMethod.onClick:
        widget.callBack?.onClick!();
        break;
      case FlutterMSMethod.onVideoStop:
        widget.callBack?.onVideoStop!();
        sendDispose();
        break;
      case FlutterMSMethod.onClose:
        widget.callBack?.onClose!();
        sendDispose();
        break;
      //ecpm
      case FlutterMSMethod.onEcpm:
        widget.callBack?.onEcpm!(call.arguments);
        break;
    }
  }
}