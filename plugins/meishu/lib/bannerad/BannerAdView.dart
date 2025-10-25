import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../flutter_ms_callback.dart';
import '../flutter_ms_code.dart';

class FlutterMSBannerView extends StatefulWidget {
  final String androidCodeId;
  final String iosCodeId;
  final double width;
  final double height;
  final FlutterMSBannerCallBack? callBack;

  /// # banner广告
  ///
  /// [androidCodeId] andrrid banner广告id 必填
  ///
  /// [iosCodeId] ios banner广告id 必填
  ///
  /// [width] 期望view宽度 dp 必填
  ///
  /// [height] 期望view高度 dp 必填
  ///
  /// [FlutterMSBannerCallBack]  banner广告回调
  ///
  FlutterMSBannerView({
    Key? key,
    required this.androidCodeId,
    required this.iosCodeId,
    required this.width,
    required this.height,
    this.callBack,
  }) : super(key: key);

  @override
  _BannerAdViewState createState() => _BannerAdViewState();
}

class _BannerAdViewState extends State<FlutterMSBannerView> {
  String _viewType = "com.bjwx.msad/BannerAdView";

  MethodChannel? _channel;

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
        height: _height,
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "androidCodeId": widget.androidCodeId,
            "width": widget.width,
            "height": widget.height,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
        width: _width,
        height: _height,
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "iosCodeId": widget.iosCodeId,
            "width": widget.width,
            "height": widget.height,
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
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      //显示广告
      case FlutterMSMethod.onShow:
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
        widget.callBack?.onShow!();
        break;
      //广告加载失败
      case FlutterMSMethod.onFail:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
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
        if (widget.callBack != null) {
          widget.callBack?.onDislike!(call.arguments);
        }
        break;
      case FlutterMSMethod.onClick:
        widget.callBack?.onClick!();
        break;
      //开屏广告ecpm
      case FlutterMSMethod.onEcpm:
        if (widget.callBack != null) {
          widget.callBack?.onEcpm!(call.arguments);
        }
        break;
    }
  }
}
