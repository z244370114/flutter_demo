import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'fracturing_curve_canvas1.dart';
import 'fracturings_model.dart';

class CurveCanvas extends StatefulWidget {
  const CurveCanvas({Key? key}) : super(key: key);

  @override
  _CurveCanvasState createState() => _CurveCanvasState();
}

class _CurveCanvasState extends State<CurveCanvas> {
  late FracturingCurveCanvas1 fracturingCurveCanvas;
  late FracturingsModel fracturingsModel;


  @override
  void initState() {
    super.initState();
    fracturingsModel = FracturingsModel();
    rootBundle.loadString('assets/title_data.json').then((value) {
      var decode = json.decode(value);
      var data = decode['data'];
      for (var i = 0; i < data.length; i++) {
        var info = FracturingsInfo.fromJson(data[i]);
        fracturingsModel.fracturingsInfoList.add(info);
      }
    });
    rootBundle.loadString('assets/cure_data.json').then((value) {
      var decode = json.decode(value);
      var data = decode['data'];
      for (var i = 0; i < data.length; i++) {
        var dataInfo = data[i];
        for (String key in dataInfo.keys) {
          if (key != 'CJSJ') {
            var parse = double.parse(dataInfo[key]);
            if (key == 'SJ') {
              fracturingsModel.sjMaxList.add(parse);
            } else {
              for (var info in fracturingsModel.fracturingsInfoList) {
                if (info.paramId == key) {
                  info.listFracturing.add(parse);
                  break;
                }
              }
            }
          } else {
            fracturingsModel.cjsjList.add(dataInfo[key]);
          }
        }
      }
      fracturingsModel.initBottomScale();
      fracturingsModel.initMarginLeftRight();
      fracturingsModel.calculatePoints();
      setState(() {
        updateCanvas();
      });
    });
    fracturingCurveCanvas = updateCanvas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('曲线图'),
      ),
      body: Column(
        children: [
          _curveCanvas(),
          _rangeCanvas(),
        ],
      ),
    );
  }

  _curveCanvas() {
    return fracturingsModel.pointOrigin != null
        ? Container(
            margin: EdgeInsets.only(top: 30.w),
            alignment: Alignment.topCenter,
            color: Colors.white,
            child: GestureDetector(
              onTapDown: (detail) {
                onTapDown(detail.localPosition);
              },
              onHorizontalDragStart: (detail) {
                onTapDown(detail.localPosition);
              },
              onHorizontalDragUpdate: (detail) {
                onTapDown(detail.localPosition);
              },
              onHorizontalDragEnd: (detail) {
                fracturingsModel.localPosition = null;
                onTapDown(fracturingsModel.localPosition);
              },
              onHorizontalDragCancel: () {
                fracturingsModel.localPosition = null;
                onTapDown(fracturingsModel.localPosition);
              },
              child: CustomPaint(
                size: Size(fracturingsModel.width, fracturingsModel.height),
                painter: fracturingCurveCanvas,
                isComplex: true,
                willChange: true,
              ),
            ),
          )
        : Container();
  }

  void onTapDown(detail) {
    if (detail != null && fracturingsModel.listPoints.isNotEmpty) {
      setState(() {
        Map map = fracturingCurveCanvas.onHitTest(detail);
        fracturingsModel.onTapDown(detail, map);
        updateCanvas();
      });
    }
  }

  FracturingCurveCanvas1 updateCanvas() {
    fracturingCurveCanvas = FracturingCurveCanvas1(
      fracturingsModel,
      localPosition: fracturingsModel.localPosition,
      marginLeft: fracturingsModel.marginLeft,
      marginRight: fracturingsModel.marginRight,
      marginBottom: fracturingsModel.marginBottom,
      zommScale: fracturingsModel.zommScale,
      translateX: fracturingsModel.translateX,
      space: fracturingsModel.space,
      width: fracturingsModel.width,
      height: fracturingsModel.height,
    );
    return fracturingCurveCanvas;
  }

  _rangeCanvas() {
    return fracturingsModel.sjMax != 0
        ? SizedBox(
            width: fracturingsModel.width -
                fracturingsModel.marginLeft -
                fracturingsModel.marginRight,
            height: 30,
            child: SfRangeSlider(
              min: 0.0,
              max: fracturingsModel.sjMax,
              values: fracturingsModel.sfRangeValues,
              stepSize: 5,
              showTicks: false,
              showLabels: false,
              enableTooltip: true,
              dragMode: SliderDragMode.both,
              minorTicksPerInterval: 0,
              onChanged: (SfRangeValues values) {
                setState(() {
                  fracturingsModel.sfRangeValues = fracturingsModel
                      .onChangedSlide(values, fracturingsModel.oldSfRange);
                });
              },
              onChangeStart: (SfRangeValues values) {
                onChangeStartSlide(values);
              },
              onChangeEnd: (SfRangeValues values) {
                onChangeEndSlide(values);
              },
            ),
          )
        : Container();
  }

  ///拖动开始的点
  onChangeStartSlide(SfRangeValues values) {
    fracturingsModel.oldSfRange = values;
  }

  ///拖动结束的点
  onChangeEndSlide(SfRangeValues values) {
    fracturingsModel.oldSfRange = values;
  }
}
