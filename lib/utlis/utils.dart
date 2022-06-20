import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  static Utils _singleton = Utils._internal();

  factory Utils() {
    return _singleton;
  }

  Utils._internal();

  @visibleForTesting
  static void changeInstance(Utils val) => _singleton = val;

  static const double _degrees2Radians = math.pi / 180.0;

  /// Converts degrees to radians
  double radians(double degrees) => degrees * _degrees2Radians;

  static const double _radians2Degrees = 180.0 / math.pi;

  /// Converts radians to degrees
  double degrees(double radians) => radians * _radians2Degrees;

  /// Returns a default size based on the screen size
  /// that is a 70% scaled square based on the screen.
  Size getDefaultSize(Size screenSize) {
    Size resultSize;
    if (screenSize.width < screenSize.height) {
      resultSize = Size(screenSize.width, screenSize.width);
    } else if (screenSize.height < screenSize.width) {
      resultSize = Size(screenSize.height, screenSize.height);
    } else {
      resultSize = Size(screenSize.width, screenSize.height);
    }
    return resultSize * 0.7;
  }

  /// Forward the view base on its degree
  double translateRotatedPosition(double size, double degree) {
    return (size / 4) * math.sin(radians(degree.abs()));
  }

  Offset calculateRotationOffset(Size size, double degree) {
    final rotatedHeight = (size.width * math.sin(radians(degree))).abs() +
        (size.height * cos(radians(degree))).abs();
    final rotatedWidth = (size.width * cos(radians(degree))).abs() +
        (size.height * sin(radians(degree))).abs();
    return Offset(
        (size.width - rotatedWidth) / 2, (size.height - rotatedHeight) / 2);
  }


  /// billion number
  /// in short scale (https://en.wikipedia.org/wiki/Billion)
  static const double billion = 1000000000;

  /// million number
  static const double million = 1000000;

  /// kilo (thousands) number
  static const double kilo = 1000;

  /// Formats and add symbols (K, M, B) at the end of number.
  ///
  /// if number is larger than [billion], it returns a short number like 13.3B,
  /// if number is larger than [million], it returns a short number line 43M,
  /// if number is larger than [kilo], it returns a short number like 4K,
  /// otherwise it returns number itself.
  /// also it removes .0, at the end of number for simplicity.
  String formatNumber(double number) {
    final isNegative = number < 0;

    if (isNegative) {
      number = number.abs();
    }

    String resultNumber;
    String symbol;
    if (number >= billion) {
      resultNumber = (number / billion).toStringAsFixed(1);
      symbol = 'B';
    } else if (number >= million) {
      resultNumber = (number / million).toStringAsFixed(1);
      symbol = 'M';
    } else if (number > kilo) {
      resultNumber = (number / kilo).toStringAsFixed(1);
      symbol = 'K';
    } else {
      resultNumber = number.toStringAsFixed(1);
      symbol = '';
    }

    if (resultNumber.endsWith('.0')) {
      resultNumber = resultNumber.substring(0, resultNumber.length - 2);
    }

    if (isNegative) {
      resultNumber = '-$resultNumber';
    }

    return resultNumber + symbol;
  }


  /// Finds the best initial interval value
  ///
  /// If there is a zero point in the axis, we a value that passes through it.
  /// For example if we have -3 to +3, with interval 2. if we start from -3, we get something like this: -3, -1, +1, +3
  /// But the most important point is zero in most cases. with this logic we get this: -2, 0, 2
  double getBestInitialIntervalValue(double min, double max, double interval,
      {double baseline = 0.0}) {
    final diff = (baseline - min);
    final mod = (diff % interval);
    if ((max - min).abs() <= mod) {
      return min;
    }
    if (mod == 0) {
      return min;
    }
    return min + mod;
  }

  /// Converts radius number to sigma for drawing shadows
  double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}