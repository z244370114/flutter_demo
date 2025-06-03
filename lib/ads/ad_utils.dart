import 'package:flutter/material.dart';
import 'package:flutter_unionad/bannerad/BannerAdView.dart';
import 'package:flutter_unionad/flutter_unionad.dart';
import 'package:flutter_unionad/nativead/NativeAdView.dart';

class AdUtils {
  static const String adUnitId =
      'ca-app-pub-3940256099942544/6300978111'; // Test ad unit ID

  static String getAdUnitId() {
    // In a real application, you might want to fetch this from a secure source or configuration
    return adUnitId;
  }

  static Future<bool> initAd() async {
    return await FlutterUnionad.register(
        //穿山甲广告 Android appid 必填
        androidAppId: "5460440",
        //穿山甲广告 ios appid 必填
        iosAppId: "5098580",
        //appname 必填
        appName: "驾照一点全能通",
        //使用聚合功能一定要打开此开关，否则不会请求聚合广告，默认这个值为false
        //true使用GroMore下的广告位
        //false使用广告变现下的广告位
        useMediation: true,
        //是否为计费用户 选填
        paid: false,
        //用户画像的关键词列表 选填
        keywords: "",
        //是否允许sdk展示通知栏提示 选填
        allowShowNotify: true,
        //是否显示debug日志
        debug: true,
        //是否支持多进程 选填
        supportMultiProcess: false,
        //主题模式 默认FlutterUnionAdTheme.DAY,修改后需重新调用初始化
        themeStatus: FlutterUnionAdTheme.DAY,
        //允许直接下载的网络状态集合 选填
        directDownloadNetworkType: [
          FlutterUnionadNetCode.NETWORK_STATE_2G,
          FlutterUnionadNetCode.NETWORK_STATE_3G,
          FlutterUnionadNetCode.NETWORK_STATE_4G,
          FlutterUnionadNetCode.NETWORK_STATE_WIFI
        ],
        androidPrivacy: AndroidPrivacy(
          //是否允许SDK主动使用地理位置信息 true可以获取，false禁止获取。默认为true
          isCanUseLocation: false,
          //当isCanUseLocation=false时，可传入地理位置信息，穿山甲sdk使用您传入的地理位置信息lat
          lat: 0.0,
          //当isCanUseLocation=false时，可传入地理位置信息，穿山甲sdk使用您传入的地理位置信息lon
          lon: 0.0,
          // 是否允许SDK主动使用手机硬件参数，如：imei
          isCanUsePhoneState: false,
          //当isCanUsePhoneState=false时，可传入imei信息，穿山甲sdk使用您传入的imei信息
          imei: "",
          // 是否允许SDK主动使用ACCESS_WIFI_STATE权限
          isCanUseWifiState: false,
          // 当isCanUseWifiState=false时，可传入Mac地址信息
          macAddress: "",
          // 是否允许SDK主动使用WRITE_EXTERNAL_STORAGE权限
          isCanUseWriteExternal: false,
          // 开发者可以传入oaid
          oaid: "e63c84300851c81e",
          // 是否允许SDK主动获取设备上应用安装列表的采集权限
          alist: false,
          // 是否能获取android ID
          isCanUseAndroidId: false,
          // 开发者可以传入android ID
          androidId: "",
          // 是否允许SDK在申明和授权了的情况下使用录音权限
          isCanUsePermissionRecordAudio: false,
          // 是否限制个性化推荐接口
          isLimitPersonalAds: false,
          // 是否启用程序化广告推荐 true启用 false不启用
          isProgrammaticRecommend: false,
        ),
        iosPrivacy: IOSPrivacy(
          //允许个性化广告
          limitPersonalAds: false,
          //允许程序化广告
          limitProgrammaticAds: false,
          //允许CAID
          forbiddenCAID: false,
        ));
  }

  static Future<Widget> openAdView(BuildContext context) async {
    return FlutterUnionadSplashAdView(
      //android 开屏广告广告id 必填 888808046 102624689
      androidCodeId: "102624689",
      //ios 开屏广告广告id 必填
      iosCodeId: "102729400",
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      // 期望view 宽度 dp 选填
      width: MediaQuery.of(context).size.width,
      //期望view高度 dp 选填
      height: MediaQuery.of(context).size.height - 100,
      //是否影藏跳过按钮(当影藏的时候显示自定义跳过按钮) 默认显示
      hideSkip: false,
      //超时时间
      timeout: 3000,
      callBack: FlutterUnionadSplashCallBack(
        onShow: () {
          print(" openAdView 开屏广告显示");
          // setState(() => _offstage = false);
        },
        onClick: () {
          print(" openAdView 开屏广告点击");
        },
        onFail: (error) {
          print(" openAdView 开屏广告失败 $error");
          Navigator.pop(context);
        },
        onFinish: () {
          print(" openAdView 开屏广告倒计时结束");
          Navigator.pop(context);
        },
        onSkip: () {
          print(" openAdView 开屏广告跳过");
          Navigator.pop(context);
        },
        onTimeOut: () {
          print(" openAdView 开屏广告超时");
        },
      ),
    );
  }

  static Future<bool> loadAd() {
    return FlutterUnionad.loadFullScreenVideoAdInteraction(
      //android 全屏广告id 必填
      androidCodeId: "103477051",
      //ios 全屏广告id 必填
      iosCodeId: "102735530",
      //视屏方向 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
    );
  }

  static Future<bool> showAd() async {
    return await FlutterUnionad.showFullScreenVideoAdInteraction();
  }

  static Future<bool> loadRewardAd() async {
    return await FlutterUnionad.loadRewardVideoAd(
      //是否个性化 选填
      androidCodeId: "103187340",
      //Android 激励视频广告id  必填
      iosCodeId: "102733764",
      //ios 激励视频广告id  必填
      rewardName: "200金币",
      //奖励名称 选填
      rewardAmount: 200,
      //奖励数量 选填
      userID: "123",
      //  用户id 选填
      orientation: FlutterUnionadOrientation.VERTICAL,
      //视屏方向 选填
      mediaExtra: null,
      //扩展参数 选填
    );
  }

  static Future<bool> showRewardAd() async {
    return await FlutterUnionad.showRewardVideoAd();
  }

  static Future<Widget> showBannerAd() async {
    return FlutterUnionadBannerView(
      //andrrid banner广告id 必填
      androidCodeId: "102624598",
      //ios banner广告id 必填
      iosCodeId: "102735527",
      // 期望view 宽度 dp 必填
      width: 600.5,
      //期望view高度 dp 必填
      height: 120.5,
      //广告事件回调 选填
      callBack: FlutterUnionadBannerCallBack(onShow: () {
        print("banner广告加载完成");
      }, onDislike: (message) {
        print("banner不感兴趣 $message");
      }, onFail: (error) {
        print("banner广告加载失败 $error");
      }, onClick: () {
        print("banner广告点击");
      },
      ),
    );
  }

  static Future<Widget> showNativeAd() async {
    //个性化模板信息流广告
    return FlutterUnionadNativeAdView(
      //android 信息流广告id 必填
      androidCodeId: "102624598",
      //ios banner广告id 必填
      iosCodeId: "102730271",
      //是否支持 DeepLink 选填
      supportDeepLink: true,
      // 期望view 宽度 dp 必填
      width: 375.5,
      //期望view高度 dp 必填
      height: 100,
      callBack: FlutterUnionadNativeCallBack(
        onShow: () {
          print("信息流广告显示");
        },
        onFail: (error) {
          print("信息流广告失败 $error");
        },
        onDislike: (message) {
          print("信息流广告不感兴趣 $message");
        },
        onClick: () {
          print("信息流广告点击");
        },
      ),
    );
  }
}
