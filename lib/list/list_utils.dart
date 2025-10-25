// import 'package:smart_device_info/smart_device_info.dart';

class ListUtils {
  static List<int> leftList = [1, 2, 3, 4, 5, 6];
  static List<int> rightList = [62, 23, 7, 9];

  static insert() {
    leftList.insert(0, 0);
    print(leftList.toString());

     // SmartDeviceInfo.instance.getDeviceInfo();
    //[0, 1, 2, 3, 4, 5, 6]
  }

  static insertAll() {
    leftList.insertAll(0, rightList);
    print(leftList.toString());
    //[62, 23, 7, 9, 1, 2, 3, 4, 5, 6]
  }

  static add() {
    leftList.add(7);
    print(leftList.toString());
    //[1, 2, 3, 4, 5, 6, 7]
  }

  static addAll() {
    leftList.addAll([8]);
    print(leftList.toString());
    //[1, 2, 3, 4, 5, 6, 8]
  }

  static remove() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.remove(3);
    print(leftList.toString());
    //[1, 2, 4, 5, 6]
  }

  static removeAt() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.removeAt(4);
    print(leftList.toString());
    //[1, 2, 3, 4, 6]
  }

  static removeRange() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.removeRange(0, 3);
    print(leftList.toString());
    //[4, 5, 6]
  }

  static removeLast() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.removeLast();
    print(leftList.toString());
    //[1, 2, 3, 4, 5]
  }

  static removeWhere() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.removeWhere((element) => element.isOdd);
    print(leftList.toString());
    //[2, 4, 6]
  }

  static setRange() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    leftList.setRange(1, 4, [1, 11, 2, 2]);
    print(leftList.toString());
    //[1, 1, 11, 2, 5, 6]
  }

  static setAll() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    leftList.setAll(3, [1, 11, 54]);
    print(leftList.toString());
    //[1, 2, 3, 1, 11, 54]
  }

  static replaceRange() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    leftList.replaceRange(3, 4, [1, 11, 2, 2]);
    print(leftList.toString());
    //[1, 2, 3, 1, 11, 2, 2, 5, 6]
  }

  static fillRange() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    leftList.fillRange(3, 5, 2);
    print(leftList.toString());
    // [1, 2, 3, 2, 2, 6]
  }

  static getRange() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    var range = leftList.getRange(1, 5);
    print(range.toString());
    //(2, 3, 4, 5)
  }

  static sublist() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    var range = leftList.sublist(3);
    print(range.toString());
    //[4, 5, 6]
    var ranges = leftList.sublist(3, 5);
    print(ranges.toString());
    //[4, 5]
  }

  ///判断数组是否 有 满足该条件
  static any() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    var any = leftList.any((element) => element > 3);
    print(any.toString());
  }

  ///判断数组是否 全部 满足该条件
  static every() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    var any = leftList.every((element) => element > 3);
    print(any.toString());
    // false
  }

  static lastWhere() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];

    /// 获取最后一个大于3的元素
    print(leftList.lastWhere((v) => v > 6));
    // 6
    // leftList.firstWhere((element) => element > 6, orElse: () {
    // });
  }

  ///从数组中查找是否满足条件，并返回索引值
  static indexWhere() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());
    //[1, 2, 3, 4, 5, 6]
    var indexWhere = leftList.indexWhere((element) => element > 7);
    print(indexWhere);
    // -1
    var indexWheres = leftList.indexWhere((element) => element > 1, 1);
    print(indexWheres);
    // 1
  }

  static lastIndexWhere() {
    List<int> leftList = [1, 2, 3, 4, 5, 2];
// 获取最后一个大于4的元素索引值
    print(leftList.lastIndexWhere((v) => v > 2)); // 5
// 从索引4开始，查询最后一个大于4的元素索引值
    print(leftList.lastIndexWhere((v) => v > 3, 4)); // 4
// 如果没有，返回-1
    print(leftList.lastIndexWhere((v) => v > 9)); // -1
  }

  static indexOf() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];

    ///从索引 3 开始查找，获取第一次出现2的索引值，如果不存在，返回 -1
    print(leftList.indexOf(2, 3));
    //-1
    print(leftList.indexOf(5));
    //4
  }

  static lastIndexOf() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.toString());

    ///从索引 3 开始查找，倒序获取第一次出现2的索引值，如果不存在，返回 -1
    print(leftList.lastIndexOf(2, 3));
    //1
    print(leftList.lastIndexOf(6));
    //5
    print(leftList.lastIndexOf(9));
    //-1
  }

  static singleWhere() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    // 获取等于2的唯一元素，存在，返回2
    print(leftList.singleWhere((v) => v == 2));
//2
    // 获取等于6的唯一元素，存在该元素，但是出现次数不唯一，不会执行orElse，直接抛出错误，进入catch
    print(leftList.singleWhere((v) => v == 6));
//6
    // 获取大于6的唯一元素，不存在该元素，执行orElse
    print(leftList.singleWhere((v) => v > 6, orElse: () {
      return orElse(1);
    }));
  }

  static orElse(s) {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(s);
  }

  static join() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    print(leftList.join('&'));
    //1&2&3&4&5&6
  }

  static toSet() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.add(3);
    print(leftList.toSet());
  }

  static forEach() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.forEach((element) {
      print(element);
    });

    for (var element in leftList) {
      print(element);
    }
  }

  static map() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    var map = leftList.map((e) {
      return e + 2;
    });
    print(map.toString());
    // (3, 4, 5, 6, 7, 8)
    var map2 = leftList.map((e) {
      return e > 3;
    });
    print(map2.toString());
    // (false, false, false, true, true, true)
  }

  ///累加器
  static reduce() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    var reduce = leftList.reduce((value, element) {
      print('value = $value ; element = $element');
      return value + element;
    });
    print(reduce.toString());
  }

  ///排序  a-b为升序， b-a为降序
  static sort() {
    List<int> leftList = [1, 2, 3, 4, 5, 6];
    leftList.sort((a, b) {
      return a - b;
    });
    print(leftList.toString());
    //b-a =  [6, 5, 4, 3, 2, 1]
  }
}

void main() {
  ListUtils.sort();
}
