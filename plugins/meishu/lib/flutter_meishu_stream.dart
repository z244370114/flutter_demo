import 'dart:async';

import 'package:flutter/services.dart';

import 'flutter_ms_callback.dart';
import 'flutter_ms_code.dart';

const EventChannel adEventEvent = EventChannel("com.bjwx.msad/adevent");

class FlutterMSStream {
  ///注册stream监听原生返回的信息
  static StreamSubscription initAdStream(
      {FlutterMSFullVideoCallBack? flutterMSFullVideoCallBack,
      FlutterMSInteractionCallBack? flutterMSInteractionCallBack,
      FlutterMSNewInteractionCallBack? flutterMSNewInteractionCallBack,
      FlutterMSRewardAdCallBack? flutterMSRewardAdCallBack}) {
    StreamSubscription _adStream =
        adEventEvent.receiveBroadcastStream().listen((data) {
      switch (data[FlutterMSType.adType]) {
        ///全屏广告
        case FlutterMSType.fullVideoAd:
          switch (data[FlutterMSMethod.onAdMethod]) {
            case FlutterMSMethod.onShow:
              if (flutterMSFullVideoCallBack?.onShow != null) {
                flutterMSFullVideoCallBack?.onShow!();
              }
              break;
            case FlutterMSMethod.onSkip:
              if (flutterMSFullVideoCallBack?.onSkip != null) {
                flutterMSFullVideoCallBack?.onSkip!();
              }
              break;
            case FlutterMSMethod.onFinish:
              if (flutterMSFullVideoCallBack?.onFinish != null) {
                flutterMSFullVideoCallBack?.onFinish!();
              }
              break;
            case FlutterMSMethod.onClose:
              if (flutterMSFullVideoCallBack?.onClose != null) {
                flutterMSFullVideoCallBack?.onClose!();
              }
              break;
            case FlutterMSMethod.onFail:
              if (flutterMSFullVideoCallBack?.onFail != null) {
                flutterMSFullVideoCallBack?.onFail!(data["error"]);
              }
              break;
            case FlutterMSMethod.onClick:
              if (flutterMSFullVideoCallBack?.onClick != null) {
                flutterMSFullVideoCallBack?.onClick!();
              }
              break;
          }
          break;

        ///插屏广告
        case FlutterMSType.interactAd:
          switch (data[FlutterMSMethod.onAdMethod]) {
            case FlutterMSMethod.onShow:
              if (flutterMSInteractionCallBack?.onShow != null) {
                flutterMSInteractionCallBack?.onShow!();
              }
              break;
            case FlutterMSMethod.onDislike:
              if (flutterMSInteractionCallBack?.onDislike != null) {
                flutterMSInteractionCallBack?.onDislike!(data["message"]);
              }
              break;
            case FlutterMSMethod.onClose:
              if (flutterMSInteractionCallBack?.onClose != null) {
                flutterMSInteractionCallBack?.onClose!();
              }
              break;
            case FlutterMSMethod.onFail:
              if (flutterMSInteractionCallBack?.onFail != null) {
                flutterMSInteractionCallBack?.onFail!(data["error"]);
              }
              break;
            case FlutterMSMethod.onClick:
              if (flutterMSInteractionCallBack?.onClick != null) {
                flutterMSInteractionCallBack?.onClick!();
              }
              break;
          }
          break;

        /// 新模板渲染插屏
        case FlutterMSType.fullScreenVideoAdInteraction:
          switch (data[FlutterMSMethod.onAdMethod]) {
            case FlutterMSMethod.onShow:
              flutterMSNewInteractionCallBack?.onShow?.call();
              break;
            case FlutterMSMethod.onClose:
              flutterMSNewInteractionCallBack?.onClose?.call();
              break;
            case FlutterMSMethod.onFail:
              flutterMSNewInteractionCallBack?.onFail?.call(data["error"]);
              break;
            case FlutterMSMethod.onClick:
              flutterMSNewInteractionCallBack?.onClick?.call();
              break;
            case FlutterMSMethod.onSkip:
              flutterMSNewInteractionCallBack?.onSkip?.call();
              break;
            case FlutterMSMethod.onFinish:
              flutterMSNewInteractionCallBack?.onFinish?.call();
              break;
            case FlutterMSMethod.onReady:
              flutterMSNewInteractionCallBack?.onReady?.call();
              break;
            case FlutterMSMethod.onUnReady:
              flutterMSNewInteractionCallBack?.onUnReady?.call();
              break;
            case FlutterMSMethod.onEcpm:
              flutterMSNewInteractionCallBack?.onEcpm?.call(
                  data[FlutterMSMethod.ecpmInfo]?.cast<String, dynamic>());
              break;
          }
          break;

        ///激励广告
        case FlutterMSType.rewardAd:
          switch (data[FlutterMSMethod.onAdMethod]) {
            case FlutterMSMethod.onShow:
              flutterMSRewardAdCallBack?.onShow?.call();
              break;
            case FlutterMSMethod.onSkip:
              flutterMSRewardAdCallBack?.onSkip?.call();
              break;
            case FlutterMSMethod.onClose:
              flutterMSRewardAdCallBack?.onClose?.call();
              break;
            case FlutterMSMethod.onFail:
              flutterMSRewardAdCallBack?.onFail?.call(data["error"]);
              break;
            case FlutterMSMethod.onClick:
              flutterMSRewardAdCallBack?.onClick?.call();
              break;
            case FlutterMSMethod.onFinish:
              flutterMSRewardAdCallBack?.onFinish?.call();
              break;
            case FlutterMSMethod.onVerify:
              flutterMSRewardAdCallBack?.onVerify?.call(
                  data["rewardVerify"],
                  data["rewardAmount"] ?? 0,
                  data["rewardName"] ?? "",
                  data["errorCode"] ?? 0,
                  data["error"] ?? "");
              break;
            case FlutterMSMethod.onRewardArrived:
              flutterMSRewardAdCallBack?.onRewardArrived?.call(
                  data["rewardVerify"]??false,
                  data["rewardType"]??0,
                  data["rewardAmount"] ?? 0,
                  data["rewardName"] ?? "",
                  data["errorCode"] ?? 0,
                  data["error"] ?? "",
                  data["propose"] ?? 1);
              break;
            case FlutterMSMethod.onReady:
              flutterMSRewardAdCallBack?.onReady?.call();
              break;
            case FlutterMSMethod.onUnReady:
              flutterMSRewardAdCallBack?.onUnReady?.call();
              break;
            case FlutterMSMethod.onCache:
              flutterMSRewardAdCallBack?.onCache?.call();
              break;
            case FlutterMSMethod.onEcpm:
              flutterMSRewardAdCallBack?.onEcpm?.call(
                  data[FlutterMSMethod.ecpmInfo]?.cast<String, dynamic>());
              break;
          }
      }
    });
    return _adStream;
  }

  static void deleteAdStream(StreamSubscription stream) {
    stream.cancel();
  }
}
