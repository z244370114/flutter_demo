import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyCanvas extends CustomPainter {
  final ui.Picture? picture;
  final ui.Image? image;

  Canvas? _canvas;

  MyCanvas(this.picture, this.image);

  @override
  void paint(Canvas canvas, Size size) {
    _canvas = canvas;
    drawPicture();
    final recorder = ui.PictureRecorder();
    final canvass = Canvas(recorder);
    final stroke1 = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvass.drawRect(Rect.fromLTWH(50, 50, 50, 50), stroke1);
    final picture1 = recorder.endRecording();
    _canvas!.drawPicture(picture1);
    _canvas!.drawRect(const Rect.fromLTWH(0.0, 0.0, 10, 10), stroke1);

    _canvas!.drawImage(image!, Offset(700, 100), stroke1);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  drawPicture() async {
    ///canvas的记录工具 用来保存canvas的
    final recorder = ui.PictureRecorder();

    ///canvas 绘图工具
    Canvas canvas = Canvas(recorder);

    ///画笔 颜色为传入颜色 状态是填充
    Paint paint = Paint();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;

    ///底下跟我画个背景
    canvas.drawRect(const Rect.fromLTWH(0, 0, 50, 50), paint);

    ///顶上再画个人
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    ///记录画的canvas
    ui.Picture picture = recorder.endRecording();
    var image = picture.toImage(50, 50);
    // _canvas!.drawImage(value, Offset(50, 50), paint);
    _canvas!.drawPicture(picture);
  }
}
