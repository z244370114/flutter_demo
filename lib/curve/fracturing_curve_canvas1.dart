import 'dart:ui';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utlis/colors_utlis.dart';
import 'package:flutter_demo/utlis/math_util.dart';
import 'package:flutter_demo/utlis/utils.dart';

import 'fracturings_model.dart';


class FracturingCurveCanvas1 extends CustomPainter {
  late Canvas ctx;

  var paints = Paint();
  TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);

  var marginLeft = 200.0;
  var marginRight = 200.0;
  var marginTop = 50.0;
  var marginBottom = 50.0;
  var width = window.physicalSize.width / window.devicePixelRatio;
  var height = window.physicalSize.height / window.devicePixelRatio;
  var localPosition;

  var space = 0.0;
  var rectWidth = 0.0;
  var rectHeight = 0.0;
  var translateX = 0.0;
  var zommScale = 1.0;

  late FracturingsModel fracturingModel;
  late FracturingData fracturingData;
  List<List<Offset>> listPoints = [];
  List<Rect> listRect = [];

  ///网格横线平均高度值
  var averageHeight = 0.0;

  ///网格横线平均宽度值
  var averageWidth = 0.0;

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

  FracturingCurveCanvas1(this.fracturingModel,
      {this.localPosition,
      this.width = 0.0,
      this.height = 0.0,
      this.marginLeft = 0.0,
      this.marginRight = 0.0,
      this.marginTop = 30.0,
      this.marginBottom = 0.0,
      this.space = 5.0,
      this.rectWidth = 20.0,
      this.rectHeight = 10.0,
      this.translateX = 0.0,
      this.zommScale = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    ctx = canvas;
    averageHeight = (height - marginBottom - marginTop) / 10;
    averageWidth = (width - marginLeft - marginRight) / 10;
    initPoint();
    initDrawTopText();
    initDrawTopDetailText();
    initDrawLine();
    initDrawYYPointLine();
    initDrawLeftRightScale();
    initDrawBottomScale();
    if (localPosition != null) {
      drawDashLine(localPosition.dx, pointTopLeft!.dy, localPosition.dx,
          pointOrigin!.dy, 5.0);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;

  ///返回点击类型 1点击曲线图 2.点击顶部标识
  onHitTest(Offset localPosition) {
    ///画布类型
    if (paintRect != null && paintRect!.contains(localPosition)) {
      return {'type': 'curveGraph', 'position': ''};
    } else {
    ///顶部标识类型
      for (var i = 0; i < listRect.length; i++) {
        Rect rect = listRect[i];
        if (rect.contains(localPosition)) {
          return {'type': 'topTypeGraph', 'position': i};
        }
      }
    }
    return {'type': 'cancel', 'position': ''};
  }

  ///1、初始化画布四个点
  initPoint() {
    pointOrigin = fracturingModel.pointOrigin;
    pointTopLeft = fracturingModel.pointTopLeft;
    pointTopRight = fracturingModel.pointTopRight;
    pointBottomRight = fracturingModel.pointBottomRight;
    paintRect = fracturingModel.paintRect;
  }

  ///2、顶部类型样式
  void initDrawTopText() {
    ///1.拿到JSON数据
    var fracturingMaxList = fracturingModel.fracturingsInfoList;
    var fontWidth = 0.0;
    var length = fracturingMaxList.length;

    ///2.算出文字的宽度
    for (var i = 0; i < length; i++) {
      var info = fracturingMaxList[i];
      Size textSize = drawTextBoxSize(info.paramName, 10.0, 'typeface');
      fontWidth += (textSize.width + space + rectWidth + 2);
    }

    ///3.算出总文字宽度的中心点，并从此点绘制出文本跟颜色标识
    var startX = (width - fontWidth) / 2;
    for (var i = 0; i < length; i++) {
      paints.style = PaintingStyle.fill;
      var info = fracturingMaxList[i];

      ///3.1点击选中，是否显示该条曲线
      if (info.isShow) {
        paints.color = ColorsUtils.hexToColor(info.curveColorPlus!);
      } else {
        paints.color = Colors.grey;
      }

      ///3.2计算颜色标识的矩形宽度
      var rect = Rect.fromLTWH(startX, 0, rectWidth, rectHeight);
      ctx.drawRect(rect, paints);

      ///3.3计算文字的起始点
      startX += rectWidth;

      ///3.4绘制文字
      Size drawSize = drawText(info.paramName, startX + 2, 5.0, 'typeface',
          10.0, paints.color, 'left', 'middle');

      ///3.5计算颜色标识与文本的绘制矩形,后期做点击事件的功能
      var rects = Rect.fromLTWH(
          startX - rectWidth, 0, rectWidth + drawSize.width, rectHeight);
      listRect.add(rects);
      startX += drawSize.width + space;
    }
  }

  ///2.1 顶部时间详情
  void initDrawTopDetailText() {
    if (fracturingModel.startTime != null) {
      var constructionDate = DateUtil.formatDateStr(fracturingModel.startTime,
          format: DateFormats.y_mo_d);
      var startDate = DateUtil.formatDateStr(fracturingModel.startTime,
          format: DateFormats.h_m_s);

      drawText('施工日期：$constructionDate', pointTopLeft!.dx, pointTopLeft!.dy,
          'typeface', 10.0, null, 'left', 'bottom');
      drawText('开始时间：$startDate', width / 2, pointTopLeft!.dy, 'typeface', 10.0,
          null, 'center', 'bottom');
    }
    if (fracturingModel.cjsjList.isNotEmpty) {
      var warehousingTime = fracturingModel.cjsjList.last;
      drawText('入库时间：$warehousingTime', pointTopRight!.dx, pointTopLeft!.dy,
          'typeface', 10.0, null, 'right', 'bottom');
    }
  }

  ///3、绘制网格
  void initDrawLine() {
    paints.color = Colors.grey;
    ///左上y值;
    var y = pointTopLeft!.dy;
    ///左上x值;
    var x = pointTopLeft!.dx;
    for (var i = 0; i < 11; i++) {
      ctx.drawLine(Offset(x, pointTopRight!.dy),
          Offset(x, height - marginBottom + 10.0), paints);
      ctx.drawLine(
          Offset(marginLeft, y), Offset(width - marginRight, y), paints);
      y += averageHeight;
      x += averageWidth;
    }
  }

  ///4、绘制曲线
  void initDrawYYPointLine() {
    ctx.save();
    ///先绘制区域
    Rect rect = Rect.fromLTWH(
        pointOrigin!.dx,
        pointTopLeft!.dy,
        pointTopRight!.dx - pointTopLeft!.dx,
        pointBottomRight!.dy - pointTopRight!.dy);
    ///裁剪区域以外的部分
    ctx.clipRect(rect);
    ///绘制每条曲线
    for (var points in fracturingModel.listPoints) {
      drawLinePoints(points);
    }
    ctx.restore();
  }

  ///5、底部刻度道
  initDrawBottomScale() {
    paints.strokeWidth = 1.0;
    var scaleHeight = 8;
    var paintWidth = width - marginRight - marginLeft;
    var space = paintWidth / 10;
    var y = pointOrigin!.dy;
    var x = marginLeft;
    for (var i = 0; i < fracturingModel.bottomScaleList.length; i++) {
      drawScale(x, y, x, y + scaleHeight);
      drawText(fracturingModel.bottomScaleList[i].toStringAsFixed(0), x,
          y + scaleHeight, 's', 10.0, null, 'center', 'top');
      x = x + space;
    }
  }

  ///6、绘制左侧刻度道
  initDrawLeftRightScale() {
    var fracturingMaxList = fracturingModel.fracturingsInfoList;
    ///左边x轴绘制起点
    var leftX = pointOrigin!.dx - space;
    ///右边x轴绘制起点
    var rightX = width - marginRight + space;
    ///总共有多少条刻度
    var length = fracturingMaxList.length;
    var even = (length / 2).round();
    ///判断奇偶数，根据它来判断左右需要绘画的刻度列数
    if (!MathUtil.isEven(length)) {
      even -= 1;
    }
    for (var i = 0; i < length; i++) {
      var maxData = fracturingMaxList[i];
      if (i < even) {
        var y = pointOrigin!.dy;
        var yyText = 0.0;
        Size? textSize;
        var textWidth = 0.0;
        for (var j = 0; j < 11; j++) {
          textSize = drawText(
              Utils().formatNumber(yyText),
              leftX,
              y,
              's',
              10.0,
              ColorsUtils.hexToColor(maxData.curveColorPlus!),
              'right',
              'middle');
          y -= averageHeight;
          yyText += (maxData.maxValue! / 10);
          if (textWidth < textSize!.width) {
            textWidth = textSize.width;
          }
        }
        leftX -= (textWidth + space);
      } else {
        var y = pointOrigin!.dy;
        var yyText = 0.0;
        Size? textSize;
        var textWidth = 0.0;
        for (var j = 0; j < 11; j++) {
          textSize = drawText(
              Utils().formatNumber(yyText),
              rightX,
              y,
              's',
              10.0,
              ColorsUtils.hexToColor(maxData.curveColorPlus!),
              'left',
              'middle');
          y -= averageHeight;
          yyText += (maxData.maxValue! / 10);
          if (textWidth < textSize!.width) {
            textWidth = textSize.width;
          }
        }
        rightX += (textWidth + space);
      }
    }
  }

  drawScale(x1, y1, x2, y2) {
    paints.color = Colors.black;
    ctx.drawLine(Offset(x1, y1), Offset(x2, y2), paints);
  }

  drawText(text, x, y, typeface, size, color, align, baseline) {
    textPainter.text = TextSpan(
      text: text,
      style: TextStyle(
          color: color ?? Colors.black,
          fontSize: size,
          fontFamily: typeface,
          fontWeight: FontWeight.bold),
    );
    textPainter.layout();
    var textSize = textPainter.size;
    var x0 = x;
    var y0 = y;
    if (align == "left") {
      x0 = x;
    } else if (align == "center") {
      x0 = x - textSize.width / 2;
    } else if (align == "right") {
      x0 = x - textSize.width;
    }
    if (baseline == "top") {
      y0 = y;
    }
    if (baseline == "middle") {
      y0 = y - textSize.height / 2;
    }
    if (baseline == "bottom") {
      y0 = y - textSize.height;
    }
    textPainter.paint(ctx, Offset(x0, y0));
    return textPainter.size;
  }

  drawTextBoxSize(text, size, typeface) {
    textPainter.text = TextSpan(
      text: text,
      style: TextStyle(
        fontSize: size,
        fontFamily: typeface,
      ),
    );
    textPainter.layout();
    return textPainter.size;
  }

  drawLinePoints(ListPoints points) {
    if (points.isShow) {
      paints.strokeWidth = 1.0;
      paints.style = PaintingStyle.stroke;
      paints.strokeCap = StrokeCap.butt;
      paints.strokeJoin = StrokeJoin.round;
      paints.color = points.color ?? Colors.black;
      ctx.drawPoints(PointMode.polygon, points.offsetZommScaleList, paints);
    }
  }

  ///7、点击绘制虚线
  drawDashLine([fromX, fromY, toX, toY, gap]) {
    var path = Path();
    path.reset();
    path.moveTo(fromX, fromY);
    path.lineTo(toX, toY);
    paints.strokeWidth = 1.0;
    var paint = Paint()
      ..strokeWidth = 1.0
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    ctx.drawPath(getDashLine(path, gap, 5.0), paint);
    drawPointTextInfo(fromX, toX);
  }

  Path getDashLine([path, dottedLength, dottedGap]) {
    Path targetPath = Path(); //虚线Path
    for (PathMetric metrice in path.computeMetrics()) {
      double distance = 0;
      bool isDrawDotted = true;
      while (distance < metrice.length) {
        if (isDrawDotted) {
          Path extractPath =
              metrice.extractPath(distance, distance + dottedLength);
          targetPath.addPath(extractPath, Offset.zero);
          distance += dottedLength;
        } else {
          distance += dottedGap;
        }
        isDrawDotted = !isDrawDotted;
      }
    }
    return targetPath;
  }

  ///绘制点击之后每个点的详细信息
  drawPointTextInfo(fromX, toX) {
    var textWidth = 0.0;
    var textHeight = 0.0;
    for (var i = 0; i < fracturingModel.fracturingsInfoList.length; i++) {
      var itemInfo = fracturingModel.fracturingsInfoList[i];
      Size textSize;
      if (i == 0) {
        textSize = drawTextBoxSize(
            '入库时间:${itemInfo.warehousingTime}  ', 10.0, 'typeface');
        textHeight += textSize.height + 5;
      } else {
        textSize = drawTextBoxSize(
            '${itemInfo.paramName}：${itemInfo.detailValues}  ',
            10.0,
            'typeface');
      }
      textHeight += textSize.height + 5;
      if (textWidth < textSize.width) {
        textWidth = textSize.width;
      }
    }
    textWidth += 10;
    var pointHeight = pointBottomRight!.dy - pointTopRight!.dy;
    var bottom = (pointHeight - textHeight) / 2;
    var top = bottom + textHeight;
    var paint = Paint();
    paint.color = Colors.black54;
    paint.style = PaintingStyle.fill;

    var l = 0.0;
    var t = 0.0;
    var r = 0.0;
    var b = 0.0;

    ///1.说明右边距离不够
    if (pointTopRight!.dx - fromX < textWidth) {
      l = fromX - textWidth;
      r = fromX;
    } else {
      l = fromX;
      r = fromX + textWidth;
    }
    t = getY(top);
    b = getY(bottom);

    RRect rrect = RRect.fromLTRBR(l, t, r, b, const Radius.circular(5.0));
    ctx.drawRRect(rrect, paint);
    var y = getY(top - 10);
    for (var i = 0; i < fracturingModel.fracturingsInfoList.length; i++) {
      var itemInfo = fracturingModel.fracturingsInfoList[i];
      if (i == 0) {
        Size size = drawText('入库时间:${itemInfo.warehousingTime}', rrect.left + 5,
            y, 'typeface', 10.0, Colors.white, 'left', 'middle');
        y += size.height + 5;
      }
      paint.color = ColorsUtils.hexToColor(itemInfo.curveColorPlus!);
      ctx.drawCircle(Offset(rrect.left + 10, y), 5, paint);
      Size textSize = drawText('${itemInfo.paramName}：${itemInfo.detailValues}',
          rrect.left + 20, y, 'typeface', 10.0, Colors.white, 'left', 'middle');
      y += textSize.height + 5;
    }
  }

  getX(x) {
    return pointOrigin!.dx + x;
  }

  getY(y) {
    return pointOrigin!.dy - y;
  }

  setCurveX(x) {
    translateX = x;
  }

  setScale(sx) {
    ctx.save();
    ctx.scale(sx, 1);
    ctx.restore();
  }
}
