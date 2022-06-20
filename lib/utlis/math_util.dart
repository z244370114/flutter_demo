import 'dart:math' as math;

class MathUtil {
  /// 返回数组中的最大值
  static double max(List<double> list) {
    double maxVal = list.reduce((v, e) => math.max(v, e));
    return maxVal;
  }

  /// 返回数组中的最小值
  static num min(List<num> list) {
    num minVal = list.reduce((v, e) => math.min(v, e));
    return minVal;
  }

  ///根据字符串的位数取整
  static int getMaxInt(num) {
    var stringAsFixed = num.toStringAsFixed(0);
    var length = stringAsFixed.length;
    var isMax = 10;
    for (var i = 1; i < length; i++) {
      isMax = 10 * isMax;
    }
    return isMax;
  }

  static double getScaleValue(nums) {
    nums += 10;
    String stringAsFixed = nums.toStringAsFixed(0);
    var replaceRange = stringAsFixed.replaceRange(
        stringAsFixed.length - 1, stringAsFixed.length, "0");
    return double.parse(replaceRange);
  }

  ///判断是奇数还是偶数
  static bool isEven(int x) {
    if (x % 2 == 0) {
      return true;
    } else {
      return false;
    }
  }

  ///二分查找
  static int binarySearch(nums, start, end, findValue) {
    while (start <= end) {
      int middle = ((start + end) / 2).truncate();
      if (findValue < nums[0].dx || findValue > nums[end].dx) {
        return -1;
      } else {
        if (middle == 0) {
          return middle;
        }
        if (nums[middle].dx <= findValue && findValue < nums[middle + 1].dx) {
          return middle;
        }
        if (findValue == nums[end].dx) {
          //查找值等于中间值直接返回
          return end;
        }
        if (findValue < nums[middle].dx) {
          //小于中间值，在中间值之前的数据中查找
          end = middle - 1;
        } else {
          //大于中间值，在中间值之后的数据中查找
          start = middle + 1;
        }
      }
    }
    return -1;
  }

  static int binarySearchNums(nums, start, end, findValue) {
    while (start <= end) {
      int middle = ((start + end) / 2).truncate();
      if (findValue < nums[0] || findValue > nums[nums.length - 1]) {
        return -1;
      } else {
        if (middle == 0) {
          return middle;
        }
        if (nums[middle] <= findValue && findValue < nums[middle + 1]) {
          return middle;
        }
        if (findValue == nums[end]) {
          return end;
        }
        if (findValue < nums[middle]) {
          //小于中间值，在中间值之前的数据中查找
          end = middle - 1;
        } else {
          //大于中间值，在中间值之后的数据中查找
          start = middle + 1;
        }
      }
    }
    return -1;
  }
}

void main() {
  var nums = [10, 20, 30, 50, 60];
  var binarySearch = MathUtil.binarySearchNums(nums, 0, 4, 59);
  print(binarySearch);

  var scaleValue = MathUtil.getScaleValue(93);
  print(scaleValue);
}
