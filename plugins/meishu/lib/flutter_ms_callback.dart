
///显示
typedef OnShow = void Function();

///失败
typedef OnFail = void Function(dynamic message);

///不喜欢
typedef OnDislike = void Function(dynamic message);

///点击
typedef OnClick = void Function();

///视频播放
typedef OnVideoPlay = void Function();

///视频暂停
typedef OnVideoPause = void Function();

///视频播放结束
typedef OnVideoStop = void Function();

///跳过
typedef OnSkip = void Function();

///倒计时结束
typedef OnFinish = void Function();

///加载超时
typedef OnTimeOut = void Function();

///关闭
typedef OnClose = void Function();

///广告预加载完成
typedef OnReady = void Function();

///广告预加载未完成
typedef OnUnReady = void Function();

///广告物料缓存成功
typedef OnCache = void Function();

///ecpm获取
typedef OnEcpm = void Function(Map<String, dynamic>? info);

///广告奖励验证
/// [isVerify] 是否成功
/// [rewardAmount]奖励数量
/// [rewardName]奖励名称
/// [errorCode]错误码
/// [message]错误信息
typedef OnVerify = void Function(bool isVerify, int rewardAmount,
    String rewardName, int errorCode, String message);

///激励广告广告进阶奖励回调参数
/// [isVerify] 是否成功
/// [rewardType]奖励类型
/// [rewardAmount]奖励数量
/// [rewardName]奖励名称
/// [errorCode]错误码
/// [error]错误信息
/// [propose] 建议奖励数量
typedef OnRewardArrived = void Function(
    bool isVerify,
    int rewardType,
    int rewardAmount,
    String rewardName,
    int errorCode,
    String error,
    double propose);

///未确定
typedef NotDetermined = void Function();

///限制
typedef Restricted = void Function();

///拒绝
typedef Denied = void Function();

///同意
typedef Authorized = void Function();

///
///banner广告回调
///
class FlutterMSBannerCallBack {
  OnShow? onShow;
  OnFail? onFail;
  OnDislike? onDislike;
  OnClick? onClick;
  OnEcpm? onEcpm;

  FlutterMSBannerCallBack({
    this.onShow,
    this.onFail,
    this.onDislike,
    this.onClick,
    this.onEcpm,
  });
}

///
///draw视频广告回调
///
class FlutterMSDrawFeedCallBack {
  OnShow? onShow;
  OnFail? onFail;
  OnClick? onClick;
  OnDislike? onDislike;
  OnVideoPlay? onVideoPlay;
  OnVideoPause? onVideoPause;
  OnVideoStop? onVideoStop;
  OnEcpm? onEcpm;

  FlutterMSDrawFeedCallBack({
    this.onShow,
    this.onFail,
    this.onClick,
    this.onDislike,
    this.onVideoPlay,
    this.onVideoPause,
    this.onVideoStop,
    this.onEcpm,
  });
}

///
///信息流广告回调
///
class FlutterMSNativeCallBack {
  OnShow? onShow;
  OnFail? onFail;
  OnDislike? onDislike;
  OnClick? onClick;
  OnEcpm? onEcpm;
  OnClose? onClose;
  OnVideoStop? onVideoStop;


  FlutterMSNativeCallBack({
    this.onShow,
    this.onFail,
    this.onDislike,
    this.onClick,
    this.onEcpm,
    this.onClose,
    this.onVideoStop,
  });
}

///
///开屏广告回调
///
class FlutterMSSplashCallBack {
  OnShow? onShow;
  OnFail? onFail;
  OnClick? onClick;
  OnFinish? onFinish;
  OnSkip? onSkip;
  OnTimeOut? onTimeOut;
  OnEcpm? onEcpm;

  FlutterMSSplashCallBack({
    this.onShow,
    this.onFail,
    this.onClick,
    this.onFinish,
    this.onSkip,
    this.onTimeOut,
    this.onEcpm,
  });
}

///
///全屏广告回调
///
class FlutterMSFullVideoCallBack {
  OnShow? onShow;
  OnClick? onClick;
  OnSkip? onSkip;
  OnClose? onClose;
  OnFail? onFail;
  OnFinish? onFinish;

  FlutterMSFullVideoCallBack({
    this.onShow,
    this.onClick,
    this.onSkip,
    this.onClose,
    this.onFail,
    this.onFinish,
  });
}

///
/// 新模板渲染插屏
///
class FlutterMSNewInteractionCallBack {
  OnShow? onShow;
  OnClick? onClick;
  OnSkip? onSkip;
  OnClose? onClose;
  OnFail? onFail;
  OnFinish? onFinish;
  OnReady? onReady;
  OnUnReady? onUnReady;
  OnEcpm? onEcpm;

  FlutterMSNewInteractionCallBack({
    this.onShow,
    this.onClick,
    this.onSkip,
    this.onClose,
    this.onFail,
    this.onFinish,
    this.onReady,
    this.onUnReady,
    this.onEcpm,
  });
}

///
///插屏广告回调
///
class FlutterMSInteractionCallBack {
  OnShow? onShow;
  OnClick? onClick;
  OnDislike? onDislike;
  OnClose? onClose;
  OnFail? onFail;

  FlutterMSInteractionCallBack({
    this.onShow,
    this.onClick,
    this.onDislike,
    this.onClose,
    this.onFail,
  });
}

///
///激励广告回调
///
class FlutterMSRewardAdCallBack {
  OnShow? onShow;
  OnClose? onClose;
  OnFail? onFail;
  OnSkip? onSkip;
  OnClick? onClick;
  OnFinish? onFinish;
  OnVerify? onVerify;
  OnRewardArrived? onRewardArrived;
  OnReady? onReady;
  OnUnReady? onUnReady;
  OnCache? onCache;
  OnEcpm? onEcpm;

  FlutterMSRewardAdCallBack({
    this.onShow,
    this.onClick,
    this.onClose,
    this.onFail,
    this.onVerify,
    this.onRewardArrived,
    this.onFinish,
    this.onSkip,
    this.onReady,
    this.onUnReady,
    this.onCache,
    this.onEcpm,
  });
}

///
///权限申请回调
///
class FlutterMSPermissionCallBack {
  NotDetermined? notDetermined;
  Restricted? restricted;
  Denied? denied;
  Authorized? authorized;

  FlutterMSPermissionCallBack({
    this.notDetermined,
    this.restricted,
    this.denied,
    this.authorized,
  });
}
