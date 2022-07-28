import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

class ImageUtils {

  static Future<ui.Image> base64ToImage(String asset, {width, height}) async {
    Uint8List bytes = base64Decode(asset);
    ui.Codec codec = await ui.instantiateImageCodec(bytes,
        targetWidth: width, targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  ///文件转 Uint8List
  static file2Uint8List(File file) async {
    Uint8List imageBytes = await file.readAsBytes();
    return imageBytes;
  }

  /// unit8List 转base64
  static uint8List2Base64(Uint8List uint8list) {
    String base64 = base64Encode(uint8list);
    return base64;
  }

  ///获取到的picture 转换成 ByteData
  ///[picture] canvas画然后记录的文件
  ///[width] 宽度
  ///[height] 高度
  static Future<ByteData?> picture2ByteData(
      ui.Picture picture, double width, double height) async {
    ui.Image img = await picture.toImage(width.toInt(), height.toInt());
    ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    return byteData;
  }

  /// 将ByteData 转成 Uint8List
  /// [data] ByteData数据
  /// return [Uint8List] Uint8List
  static byteData2Uint8List(ByteData data) {
    return data.buffer.asUint8List();
  }
}
