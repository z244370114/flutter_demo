import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'my_canvas.dart';

const kCanvasSize = 200.0;

class PictureRecorderPage extends StatefulWidget {
  const PictureRecorderPage({Key? key}) : super(key: key);

  @override
  _PictureRecorderPageState createState() => _PictureRecorderPageState();
}

class _PictureRecorderPageState extends State<PictureRecorderPage> {
  ByteData? imgBytes;
  ui.Image? _image;
  ui.Picture? _picture;

  @override
  void initState() {
    super.initState();
    // loadImage('assets/images/face.jpg').then((image) {
    //   setState(() {
    //     _image = image;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1'),
      ),
      body: Container(
        color: Colors.green,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomPaint(
              size: Size(1000, 200),
              painter: MyCanvas(null, _image),
            ),
            // _picture != null
            //     ? CustomPaint(
            //         painter: MyCanvas(_picture!),
            //       )
            //     : Container(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                  child: const Text('Generate image'),
                  onPressed: generateImage),
            ),
            imgBytes != null
                ? Container(
                    color: Colors.yellow,
                    child: Image.memory(
                      Uint8List.view(imgBytes!.buffer),
                      width: kCanvasSize,
                      height: kCanvasSize,
                    ))
                : Container()
          ],
        ),
      ),
    );
  }

  void generateImage() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromPoints(Offset(0.0, 0.0), Offset(kCanvasSize, kCanvasSize)));
    final stroke = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawRect(Rect.fromLTWH(0.0, 0.0, kCanvasSize, kCanvasSize), stroke);
    // canvas.drawImageRect(
    //     _image,
    //     Rect.fromLTWH(0, 0, _image.width.toDouble(), _image.height.toDouble()),
    //     Rect.fromLTWH(0, 0, 200, 200),
    //     Paint());
    final picture = recorder.endRecording();
    ui.Image img = await picture.toImage(200, 200);
    final recorder2 = ui.PictureRecorder();
    final canvasClip = Canvas(recorder2, Rect.fromLTWH(0, 0, 150, 150));
    canvasClip.drawImageRect(img, Rect.fromLTWH(0, 0, 200, 200),
        Rect.fromLTWH(0, 0, 150, 150), Paint()..color = Colors.green);
    canvasClip.drawRect(
        Rect.fromLTWH(0, 0, 50, 50), Paint()..color = Colors.black);
    final picture2 = recorder2.endRecording();
    ui.Image img2 = await picture2.toImage(50, 150);
    final pngBytes = await img2.toByteData(format: ui.ImageByteFormat.png);
    setState(() {
      imgBytes = pngBytes;
      _picture = picture2;
      _image = img2;
    });
  }
}
