import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsUtils {
  ///字符串 #FF0000 转 Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static Color stringToColor(color) {
    if (color is String) {
      if (color.contains('rgb')) {
        var indexOf = color.indexOf('(');
        var colors = color.substring(indexOf + 1, color.length - 1).split(',');
        return Color.fromRGBO(
          int.parse(colors[0]),
          int.parse(colors[1]),
          int.parse(colors[2]),
          double.parse(colors[3]),
        );
      } else if (color.contains('#')) {
        return hexToColor(color);
      }
    } else {
      return color;
    }
    return Colors.white;
  }

  static String colorToHex(Color color) {
    return color.toString().substring(10, 16);
  }

  static Color randomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
