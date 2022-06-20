import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/douglas/douglas_utils.dart';
import 'package:flutter_demo/douglas/point_data.dart';
import 'package:flutter_demo/utlis/colors_utlis.dart';
import 'package:flutter_demo/utlis/math_util.dart';
import 'package:flutter_demo/utlis/utils.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:json2dart_safe/json2dart.dart';


class FracturingsModel {
  var sjMax = 0;
  var startTime;
  var endTime;

  var marginLeft = 0.0;
  var marginRight = 0.0;
  var marginTop = 30.0;
  var marginBottom = 30.0;
  var rectHeight = 20.0;
  var ratioY = 0.0;
  var ratioX = 0.0;
  var space = 5.0;
  var translateX = 0.0;
  var zommScale = 1.0;

  var top = MediaQueryData.fromWindow(window).padding.top;
  var size = MediaQuery.of(Get.context!).size;
  var width = 0.0;
  var height = 0.0;

  ///顶部详细数据
  List<FracturingsInfo> fracturingsInfoList = [];

  ///时间刻度
  List<double> sjMaxList = [];

  ///入库时间
  List<String> cjsjList = [];

  ///曲线点数组
  List<ListPoints> listPoints = [];

  ///底部刻度道
  List bottomScaleList = [];

  ///原点坐标
  Offset? pointOrigin;

  ///原点顶部左边坐标
  Offset? pointTopLeft;

  ///原点顶部右边坐标
  Offset? pointTopRight;

  ///原点底部右边坐标
  Offset? pointBottomRight;

  ///画布的坐标系的Rect
  Rect? paintRect;


  ///底部滑动缩放值
  SfRangeValues sfRangeValues = SfRangeValues(0, 0);

  ///底部滑动旧缩放值
  SfRangeValues oldSfRange = SfRangeValues(0, 0);
  var localPosition;

  FracturingsModel() {
    width = size.width - 160.w;
    height = size.height - top - marginBottom - 300.w;
  }

  void initBottomScale() {
    bottomScaleList.clear();
    sjMax = MathUtil.getMaxInt(MathUtil.max(sjMaxList).toInt()) + 20;
    var d = sjMax ~/ 10;
    var s = 0;
    bottomScaleList.add(0);
    for (var i = 0; i < 10; i++) {
      s += d;
      bottomScaleList.add(s);
    }
  }

  initMarginLeftRight() {
    sfRangeValues = SfRangeValues(0, sjMax);
    oldSfRange = SfRangeValues(0, sjMax);
    zommScale = 1.0;
    var fontWidth = 0.0;
    var endTextSizeWidth = 0.0;
    var length = fracturingsInfoList.length;
    for (var i = 0; i < length; i++) {
      TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text = TextSpan(
        text: Utils().formatNumber(fracturingsInfoList[i].maxValue!.toDouble()),
        style: const TextStyle(fontSize: 10.0),
      );
      textPainter.layout();
      Size textSize = textPainter.size;
      fontWidth += (textSize.width + space);
      if (textSize.width > endTextSizeWidth) {
        endTextSizeWidth = textSize.width;
      }
    }
    if (MathUtil.isEven(length)) {
      marginLeft = fontWidth / 2;
      marginRight = fontWidth / 2;
    } else {
      marginLeft = fontWidth / 2 - endTextSizeWidth + space;
      marginRight = fontWidth / 2 + endTextSizeWidth - space;
    }
    ratioX = getRatioX(sjMax);
    initPoint();
  }

  ///2.初始化原点
  initPoint() {
    pointOrigin = Offset(marginLeft, height - marginBottom + 10.0);
    pointTopLeft = Offset(marginLeft, marginTop + 10.0);
    pointTopRight = Offset(width - marginRight, marginTop + 10.0);
    pointBottomRight =
        Offset(width - marginRight, height - marginBottom + 10.0);
    paintRect = Rect.fromLTRB(pointTopLeft!.dx, pointTopLeft!.dy,
        pointTopRight!.dx, pointBottomRight!.dy);
  }

  ///3.计算点的坐标数组
  calculatePoints() {
    listPoints.clear();
    var listSJ = sjMaxList;
    for (int i = 0; i < fracturingsInfoList.length; i++) {
      listPoints.add(ListPoints());
      var fracturingsInfo = fracturingsInfoList[i];
      var pointYList = fracturingsInfo.listFracturing;
      var maxScale = fracturingsInfo.maxValue;
      var pointList = listPoints[i].pointDataList;
      var offsetList = listPoints[i].offsetList;
      for (int j = 0; j < pointYList.length; j++) {
        var pointX = listSJ[j];
        pointList.add(getPointData(pointX, pointYList[j], maxScale));
      }
      listPoints[i].color =
          ColorsUtils.hexToColor(fracturingsInfo.curveColorPlus!);
      var dilute = Douglas.toDilute(pointList);
      pointList.clear();
      for (var item in dilute) {
        offsetList.add(Offset(item.x, item.y));
      }
      listPoints[i].offsetZommScaleList = List.from(offsetList);
    }
  }

  getPointData(x, y, [maxY]) {
    var ratioY = (height - marginBottom - marginTop) / maxY;
    var dx = marginLeft + x * ratioX * zommScale;
    var dy = height - marginBottom + rectHeight - 10 - y * ratioY;
    return PointData(0, dx, dy);
  }

  ///获取X轴比例
  getRatioX(max) {
    return (width - marginLeft - marginRight) / max;
  }

  getY(dy, maxY) {
    var ratioY = (height - marginBottom - marginTop - rectHeight) / maxY;
    var y = (dy + height + marginBottom - rectHeight + 10) / ratioY;
    return y;
  }

  getTimeX(dx) {
    ///比例
    var k = (dx - marginLeft) / (width - marginLeft - marginRight);

    ///x轴的时间值
    var timeX =
        (sfRangeValues.end - sfRangeValues.start) * k + sfRangeValues.start;
    return timeX;
  }

  SfRangeValues onChangedSlide(SfRangeValues values, SfRangeValues oldSfRange) {
    bottomScaleList.clear();

    ///刻度总宽度
    var totalWidth = values.end - values.start;
    var equalParts = totalWidth ~/ 10;

    ///起始位置
    var start = values.start;

    ///结束位置
    var end = values.end;
    zommScale = sjMax / totalWidth;
    var newMax = sjMax / zommScale;
    equalParts = newMax / 10;

    ///重新换算x轴比例
    ratioX = getRatioX(newMax);
    var oldWith = (width - marginLeft - marginRight);
    var newWidth = oldWith * zommScale;
    bottomScaleList.add(start);
    for (var i = 0; i < 10; i++) {
      start += equalParts;
      bottomScaleList.add(start);
    }
    if (oldSfRange.start == values.start) {
      ///说明是拖动的结束点
      if (values.start != 0) {
        translateX = values.start / sjMax * newWidth;
      } else {
        translateX = 0;
      }
      for (var points in listPoints) {
        points.offsetZommScaleList = List.from(points.offsetList);
        for (var i = 0; i < points.offsetZommScaleList.length; i++) {
          var d = (points.offsetZommScaleList[i].dx - marginLeft) * zommScale +
              marginLeft;
          points.offsetZommScaleList[i] =
              Offset(d, points.offsetZommScaleList[i].dy);
          points.offsetZommScaleList[i] =
              points.offsetZommScaleList[i].translate(-translateX, 0.0);
        }
      }
    } else if (oldSfRange.end == values.end) {
      /// 说明是拖动的开始点
      if (values.end != 0) {
        translateX = values.start / sjMax * newWidth;
      } else {
        translateX = (sjMax - totalWidth) / sjMax * newWidth;
      }
      for (var points in listPoints) {
        points.offsetZommScaleList = List.from(points.offsetList);
        for (var i = 0; i < points.offsetZommScaleList.length; i++) {
          var d = (points.offsetZommScaleList[i].dx - marginLeft) * zommScale +
              marginLeft;
          points.offsetZommScaleList[i] =
              Offset(d, points.offsetZommScaleList[i].dy);
          points.offsetZommScaleList[i] =
              points.offsetZommScaleList[i].translate(-translateX, 0.0);
        }
      }
    } else if (oldSfRange.start != values.start &&
        oldSfRange.end != values.end) {
      print('说明是拖动的整条线');
      translateX = values.start / sjMax * newWidth;
      for (var points in listPoints) {
        points.offsetZommScaleList = List.from(points.offsetList);
        for (var i = 0; i < points.offsetZommScaleList.length; i++) {
          var d = (points.offsetZommScaleList[i].dx - marginLeft) * zommScale +
              marginLeft;
          points.offsetZommScaleList[i] =
              Offset(d, points.offsetZommScaleList[i].dy);
          points.offsetZommScaleList[i] =
              points.offsetZommScaleList[i].translate(-translateX, 0.0);
        }
      }
    }
    return values;
  }

  void onTapDown(detail, map) {
    if (detail != null) {
      var type = map['type'];
      if (type == 'curveGraph') {
        ///点击的是曲线图
        localPosition = detail;
        var listPoint = listPoints[0];
        var length = listPoint.offsetList.length;
        var startOffset = listPoint.offsetList[0];
        var endOffset = listPoint.offsetList[length - 1];
        if (detail.dx > startOffset.dx || detail.dx < endOffset.dx) {
          ///点击的x点
          var x = double.parse(getTimeX(detail.dx).toStringAsFixed(4));
          var fracturingList = fracturingsInfoList;
          for (var i = 0; i < fracturingList.length; i++) {
            var fracturingMaxList = fracturingsInfoList[i];
            var itemList = fracturingList[i].listFracturing;
            var info = 0.0;
            var sjList = sjMaxList;
            var time = '';
            ///通过二分查找到相应的索引，进行获取详细的数据信息，进行展示
            var index =
                MathUtil.binarySearchNums(sjList, 0, sjList.length - 1, x);
            if (index == -1) {
              info = 0.0;
              time = '';
            } else if (index == 0 || index == fracturingList.length - 1) {
              info = itemList[index];
              time = cjsjList[index];
            } else {
              time = cjsjList[index];
              var x0 = sjList[index];
              var x1 = sjList[index + 1];
              var y0 = itemList[index];
              var y1 = itemList[index + 1];
              var k = (x - x0) / (x1 - x0);
              var y = y0 + (y1 - y0) * k;
              info = y;
            }
            fracturingMaxList.warehousingTime = time;
            fracturingMaxList.detailValues = info.toStringAsFixed(2);
          }
        }
      } else if (type == 'topTypeGraph') {
        var position = map['position'];
        fracturingsInfoList[position].isShow =
            !fracturingsInfoList[position].isShow;
        listPoints[position].isShow = !listPoints[position].isShow;
      }
    }
  }
}

class FracturingsInfo {
  String? id;
  String? userId;
  String? paramId;
  String? paramName;
  int? maxValue;
  String? values;
  String? detailValues;
  String? warehousingTime;
  String? curveColor;
  String? sort;
  String? wgId;
  String? yid;
  String? type;
  String? curveColorPlus;
  bool isShow = true;

  List<double> listFracturing = [];

  FracturingsInfo({
    this.id,
    this.userId,
    this.paramId,
    this.paramName,
    this.maxValue,
    this.values = '0.0',
    this.curveColor,
    this.sort,
    this.wgId,
    this.yid,
    this.type,
    this.curveColorPlus,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{}
      ..put('id', id)
      ..put('userId', userId)
      ..put('paramId', paramId)
      ..put('paramName', paramName)
      ..put('maxValue', maxValue)
      ..put('values', values)
      ..put('curveColor', curveColor)
      ..put('sort', sort)
      ..put('wgId', wgId)
      ..put('yid', yid)
      ..put('type', type)
      ..put('curveColorPlus', curveColorPlus);
  }

  FracturingsInfo.fromJson(Map<String, dynamic> json) {
    id = json.asString('id');
    userId = json.asString('userId');
    paramId = json.asString('paramId');
    paramName = json.asString('paramName');
    maxValue = json.asInt('maxValue');
    values = json.asString('values');
    if (values == '') {
      values = '0.0';
    }
    curveColor = json.asString('curveColor');
    sort = json.asString('sort');
    wgId = json.asString('wgId');
    yid = json.asString('yid');
    type = json.asString('type');
    curveColorPlus = json.asString('curveColorPlus');
    if (curveColorPlus == '') {
      curveColorPlus = '#FF0000';
    }
  }
}

class FracturingLeftData {
  String? JH;
  String? SGRQ;
  String? CW;
  String? YLFS;
  String? SGDW;
  String? SGZT;
  String? YID;
  String? FIELDS;
  String? STAGE;
  String? rtmpUrl;
  String? ENDINGTIME;
  String? transportType;
  String? problem;
  String? isNormal;
  String? INSERTTIME;
  String? id;
  String? DATASUMMARY;
  String? SECRET;
  String? PERFORATIONSECTION;
  String? warningCount;
  bool isSelect = false;

  FracturingLeftData(
      {this.JH,
      this.SGRQ,
      this.CW,
      this.YLFS,
      this.SGDW,
      this.SGZT,
      this.YID,
      this.FIELDS,
      this.STAGE,
      this.rtmpUrl,
      this.ENDINGTIME,
      this.transportType,
      this.problem,
      this.isNormal,
      this.INSERTTIME,
      this.id,
      this.DATASUMMARY,
      this.SECRET,
      this.PERFORATIONSECTION,
      this.warningCount});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{}
      ..put('JH', JH)
      ..put('SGRQ', SGRQ)
      ..put('CW', CW)
      ..put('YLFS', YLFS)
      ..put('SGZT', SGZT)
      ..put('YID', YID)
      ..put('FIELDS', FIELDS)
      ..put('STAGE', STAGE)
      ..put('rtmpUrl', rtmpUrl)
      ..put('ENDINGTIME', ENDINGTIME)
      ..put('transportType', transportType)
      ..put('problem', problem)
      ..put('isNormal', isNormal)
      ..put('INSERT_TIME', INSERTTIME)
      ..put('id', id)
      ..put('DATA_SUMMARY', DATASUMMARY)
      ..put('SECRET', SECRET)
      ..put('PERFORATION_SECTION', PERFORATIONSECTION)
      ..put('warningCount', warningCount);
  }

  FracturingLeftData.fromJson(Map<String, dynamic> json) {
    JH = json.asString('JH');
    SGRQ = json.asString('SGRQ');
    CW = json.asString('CW');
    YLFS = json.asString('YLFS');
    SGDW = json.asString('SGDW');
    SGZT = json.asString('SGZT');
    YID = json.asString('YID');
    FIELDS = json.asString('FIELDS');
    STAGE = json.asString('STAGE');
    rtmpUrl = json.asString('rtmpUrl');
    ENDINGTIME = json.asString('ENDINGTIME');
    transportType = json.asString('transportType');
    problem = json.asString('problem');
    isNormal = json.asString('isNormal');
    INSERTTIME = json.asString('INSERT_TIME');
    id = json.asString('id');
    DATASUMMARY = json.asString('DATA_SUMMARY');
    SECRET = json.asString('SECRET');
    PERFORATIONSECTION = json.asString('PERFORATION_SECTION');
    warningCount = json.asString('warningCount');
  }
}

class ListPoints {
  List<PointData> pointDataList = [];
  List<Offset> offsetList = [];
  List<Offset> offsetZommScaleList = [];
  var isShow = true;
  var color;
}

class FracturingData {
  ///油压
  double? YY;

  ///套压
  double? SCSJ;
  double? CJSJ;

  ///油管排量
  double? YGPL;

  ///套压
  double? TY;
  double? ZYL;
  String? BATCHID;

  ///液氮排量
  double? YDPL;

  ///套管沙比
  double? SB;

  ///总沙量
  double? ZSL;

  ///
  double? JDL;

  ///
  double? RKSJ;
  double? SJ;

  FracturingData({
    this.YY,
    this.SCSJ,
    this.CJSJ,
    this.YGPL,
    this.TY,
    this.ZYL,
    this.BATCHID,
    this.YDPL,
    this.SB,
    this.ZSL,
    this.JDL,
    this.RKSJ,
    this.SJ,
  });

  Map<String, dynamic> toJson() {
    return Map<String, dynamic>()
      ..put('YY', YY)
      ..put('SCSJ', SCSJ)
      ..put('CJSJ', CJSJ)
      ..put('YGPL', YGPL)
      ..put('TY', TY)
      ..put('ZYL', ZYL)
      ..put('BATCH_ID', BATCHID)
      ..put('YDPL', YDPL)
      ..put('SB', SB)
      ..put('ZSL', ZSL)
      ..put('JDL', JDL)
      ..put('RKSJ', RKSJ)
      ..put('SJ', SJ);
  }

  FracturingData.fromJson(Map<dynamic, dynamic> json) {
    YY = json.asDouble('YY');
    SCSJ = json.asDouble('SCSJ');
    CJSJ = json.asDouble('CJSJ');
    YGPL = json.asDouble('YGPL');
    TY = json.asDouble('TY');
    ZYL = json.asDouble('ZYL');
    BATCHID = json.asString('BATCH_ID');
    YDPL = json.asDouble('YDPL');
    SB = json.asDouble('SB');
    ZSL = json.asDouble('ZSL');
    JDL = json.asDouble('JDL');
    RKSJ = json.asDouble('RKSJ');
    SJ = json.asDouble('SJ');
  }
}
